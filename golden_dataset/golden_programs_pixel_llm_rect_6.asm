; DESCRIPTION: This GeOS assembly code initializes the registers r7 through r12 with the value 10 and register r15 with the color value 0x44FF44. It then draws a filled rectangle using these values as coordinates and color before halting execution.

; Pixel-LLM Sample 5 - should assemble
LDI r7, 10
LDI r8, 10
LDI r0, 10
LDI r12, 10
LDI r15, 0x44FF44
RECTF r7, r8, r0, r12, r15
HALT
