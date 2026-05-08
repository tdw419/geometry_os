; DESCRIPTION: This GeOS assembly code initializes the registers r4 through r2 with the value 10 and register r6 with the color value 0x44FF44. It then draws a filled rectangle using these values as coordinates and color before halting execution.

; Pixel-LLM Sample 5 - should assemble
LDI r4, 10
LDI r13, 10
LDI r10, 10
LDI r2, 10
LDI r6, 0x44FF44
RECTF r4, r13, r10, r2, r6
HALT
