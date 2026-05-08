; DESCRIPTION: This GeOS assembly code initializes the registers r4 through r2 with the value 10 and register r13 with the color value 0x44FF44. It then draws a filled rectangle using these values as coordinates and color before halting execution.

; Pixel-LLM Sample 5 - should assemble
LDI r4, 10
LDI r11, 10
LDI r12, 10
LDI r2, 10
LDI r13, 0x44FF44
RECTF r4, r11, r12, r2, r13
HALT
