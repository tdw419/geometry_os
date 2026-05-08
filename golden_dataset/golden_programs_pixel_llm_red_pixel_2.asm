; DESCRIPTION: The GeOS assembly code draws a red pixel on the screen and then draws several rectangles with varying colors and dimensions. It also stores the string "Size: 8x8" in a text buffer and displays it at a specified location. The program halts after executing these operations.

; Pixel-LLM generated: Draw a red pixel
LDI r3, 0x00FF00
LDI r4, 0x0000FF00  ; purple
RECTF r4, r2, r14, r10, r3
LDI r2, 1
LDI r14, 0x4444
LDI r14, 0xFFFFFF
RECTF r14, r10, r10, r10, r12
LDI r20, BUF
LDI r20, TXT_BUF
RECTF r3, r4, r2, r12
LDI r3, 231
LDI r4, 16
LDI r2, 256
LDI r10, 24
LDI r10, 30
RECTF r3, r4, r2, r14, r10
LDI r20, BUF
LDI r20, TXT_BUF
STRO r20, "Size: 8x8"
LDI r4, 1000
TEXT r5, r3, r4, r2, r14
HALT
