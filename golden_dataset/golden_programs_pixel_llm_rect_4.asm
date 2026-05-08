; DESCRIPTION: This GeOS assembly code initializes the registers r11 through r4 with the value 10 and register r7 with the color value 0x44FF44. It then draws a filled rectangle using these values as coordinates and color before halting execution.

; Pixel-LLM Sample 5 - should assemble
LDI r11, 10
LDI r1, 10
LDI r13, 10
LDI r4, 10
LDI r7, 0x44FF44
RECTF r11, r1, r13, r4, r7
HALT
