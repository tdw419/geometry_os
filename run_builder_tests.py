import asyncio
import sys
from pathlib import Path
from playwright.async_api import async_playwright, expect

async def run_tests():
    async with async_playwright() as p:
        browser = await p.chromium.launch(headless=True)
        page = await browser.new_page()

        # Construct the file URL for the HTML test page
        html_file_path = Path("systems/visual_shell/web/builder_tools_test.html").resolve()
        file_url = f"file://{html_file_path}"

        print(f"Navigating to: {file_url}")
        await page.goto(file_url, wait_until="domcontentloaded")

        # Capture console output and page errors
        page_errors = []
        page.on("console", lambda msg: print(f"PAGE CONSOLE ({msg.type.upper()}): {msg.text}"))
        page.on("pageerror", lambda err: page_errors.append(f"PAGE ERROR: {err}"))

        # Wait for the main elements to be visible
        await page.wait_for_selector('#run-all', state='visible')
        await page.wait_for_selector('#passed', state='visible')
        await page.wait_for_selector('#failed', state='visible')

        print("Page loaded. Running all builder tests...")
        await page.click('#run-all')

        # Wait for all tests to complete (passed + failed should equal total tests)
        # Assuming 6 tests in total for builder_tools_test.html
        # We'll wait until the status is not "Running..." or 'Ready'
        print("Waiting for all builder tests to complete...")
        await page.screenshot(path="debug_builder_tests_stuck.png") # Capture state before assertion
        await expect(page.locator('#status')).not_to_have_text('Running...', timeout=120000)
        await expect(page.locator('#status')).not_to_have_text('Ready', timeout=1000) # Quick check, should be 'All Passed!' or something else

        print("All builder tests completed. Collecting results...")
        await page.screenshot(path="debug_builder_tests_stuck.png")

        # Get results
        passed_count = int(await page.locator('#passed').text_content())
        failed_count = int(await page.locator('#failed').text_content())
        total_tests = passed_count + failed_count

        print(f"\n--- Builder Test Summary ---")
        print(f"Total Tests: {total_tests}")
        print(f"Passed: {passed_count}")
        print(f"Failed: {failed_count}")
        print(f"----------------------------")

        # Report any page errors
        if page_errors:
            print("\n❌ Errors found on page:")
            for err in page_errors:
                print(err)
            failed_count += len(page_errors) # Consider page errors as failures

        await browser.close()

        if failed_count > 0:
            print("❌ Some builder tests failed.")
            sys.exit(1)
        else:
            print("✅ All builder tests passed!")
            sys.exit(0)

if __name__ == "__main__":
    asyncio.run(run_tests())
