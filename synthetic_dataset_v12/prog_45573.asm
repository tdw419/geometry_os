; DESCRIPTION: Composite: Sets a single blue pixel at (154, 253) then Draws a white rectangle at (325, 3) with width 89 and height 93 then Draws a purple line from (8, 50) to (218, 191).
; PLAN: r0=154(x), r1=253(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=325(x), r6=3(y), r7=89(width), r8=93(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=8(x1), r11=50(y1), r12=218(x2), r13=191(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 154
LDI r1, 253
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 325
LDI r6, 3
LDI r7, 89
LDI r8, 93
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 8
LDI r11, 50
LDI r12, 218
LDI r13, 191
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
