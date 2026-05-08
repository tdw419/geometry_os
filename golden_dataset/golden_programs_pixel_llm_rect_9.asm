; DESCRIPTION: This GeOS assembly code initializes the registers r11 through r6 with the value 10 and register r0 with the color value 0x44FF44. It then draws a filled rectangle using these values as coordinates and color before halting execution.

; Pixel-LLM Sample 5 - should assemble
LDI r11, 10
LDI r4, 10
LDI r2, 10
LDI r6, 10
LDI r0, 0x44FF44
RECTF r11, r4, r2, r6, r0
HALT
