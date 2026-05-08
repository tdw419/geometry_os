; DESCRIPTION: This GeOS assembly code initializes the registers r3 through r2 with the value 10 and register r9 with the color value 0x44FF44. It then draws a filled rectangle using these values as coordinates and color before halting execution.

; Pixel-LLM Sample 5 - should assemble
LDI r3, 10
LDI r6, 10
LDI r10, 10
LDI r2, 10
LDI r9, 0x44FF44
RECTF r3, r6, r10, r2, r9
HALT
