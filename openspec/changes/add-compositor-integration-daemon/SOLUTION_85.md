# Solution for Task: Create end-to-end integration test

##### Context: Geometry OS Implementation Agent

Change ID: add-compositor-integration-daemon

Task: Create end-to-end integration test

1. File paths that need to be created or modified:
   - `src/geometry_os/compositor/test/integration` (where integration tests should be written)
   - `tests/geometry_os/compositor/integration_suite_tests` (where integration suite tests will be executed)

2. A brief snippet of the Python or Rust code required:
   ```python
   # This file contains an example implementation of a simple compositor integration test. It
   # demonstrates how to write a custom CompositorIntegrationTest class and use it in the
   # GeometryOS::CompositorIntegrationSuite class.

   from geometry_os.compositor import Compositor, CompositorInterface
   from geometry_os.test_utils import IntegrationTestCase
   from tests.geometry_os.compositor.integration import CompositorIntegrationSuite

   class SimpleCompositorIntegrationTest(IntegrationTestCase):
       def setUp(self) -> None:
           self.compositor = Compositor()

       def tearDown(self) -> None:
           self.compositor.close()

       def test_simple_integration(self) -> None:
           self.compositor.create_compositor_interface().start()
           for i in range(10):
               self.compositor.draw_circle(i).wait_for_completion()
           self.compositor.close()
   ```

3. A 'Next Step' command for the user:
   - Run `python tests/geometry_os/compositor/integration_suite_tests.py` to execute the integration suite test cases