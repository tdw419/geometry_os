; DESCRIPTION: This GeOS assembly code initializes the registers r2 through r12 with the value 10 and register r13 with the color value 0x44FF44. It then draws a filled rectangle using these values as coordinates and color before halting execution.

; Pixel-LLM Sample 5 - should assemble
LDI r2, 10
LDI r15, 10
LDI r1, 10
LDI r12, 10
LDI r13, 0x44FF44
RECTF r2, r15, r1, r12, r13
HALT
