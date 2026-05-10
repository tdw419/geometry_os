; DESCRIPTION: Composite: Sets a single blue pixel at (407, 147) then Draws a red line from (254, 64) to (358, 166) then Places a white 63x32 rectangle at position (100, 26).
; PLAN: r0=407(x), r1=147(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=254(x1), r6=64(y1), r7=358(x2), r8=166(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=100(x), r11=26(y), r12=63(width), r13=32(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 407
LDI r1, 147
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 254
LDI r6, 64
LDI r7, 358
LDI r8, 166
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 100
LDI r11, 26
LDI r12, 63
LDI r13, 32
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
