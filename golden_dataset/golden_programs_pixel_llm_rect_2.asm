; DESCRIPTION: This GeOS assembly code initializes the registers r2 through r6 with the value 10 and register r10 with the color value 0x44FF44. It then draws a filled rectangle using these values as coordinates and color before halting execution.

; Pixel-LLM Sample 5 - should assemble
LDI r2, 10
LDI r12, 10
LDI r14, 10
LDI r6, 10
LDI r10, 0x44FF44
RECTF r2, r12, r14, r6, r10
HALT
