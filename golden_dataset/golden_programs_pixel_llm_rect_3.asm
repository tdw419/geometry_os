; DESCRIPTION: This GeOS assembly code initializes the registers r12 through r2 with the value 10 and register r11 with the color value 0x44FF44. It then draws a filled rectangle using these values as coordinates and color before halting execution.

; Pixel-LLM Sample 5 - should assemble
LDI r12, 10
LDI r15, 10
LDI r8, 10
LDI r2, 10
LDI r11, 0x44FF44
RECTF r12, r15, r8, r2, r11
HALT
