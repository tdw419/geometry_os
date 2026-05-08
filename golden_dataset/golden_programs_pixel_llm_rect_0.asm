; DESCRIPTION: This GeOS assembly code initializes the registers r1 through r4 with the value 10 and register r5 with the color value 0x44FF44. It then draws a filled rectangle using these values as coordinates and color before halting execution.

; Pixel-LLM Sample 5 - should assemble
LDI r1, 10
LDI r2, 10
LDI r3, 10
LDI r4, 10
LDI r5, 0x44FF44
RECTF r1, r2, r3, r4, r5
HALT
