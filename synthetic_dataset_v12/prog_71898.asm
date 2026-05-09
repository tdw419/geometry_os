; DESCRIPTION: Composite: Places a yellow dot at position (444, 178) then Places a yellow line segment connecting (19, 234) to (199, 219) then Places a white 40x85 rectangle at position (158, 144).
; PLAN: r0=444(x), r1=178(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=19(x1), r6=234(y1), r7=199(x2), r8=219(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=158(x), r11=144(y), r12=40(width), r13=85(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 444
LDI r1, 178
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 19
LDI r6, 234
LDI r7, 199
LDI r8, 219
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 158
LDI r11, 144
LDI r12, 40
LDI r13, 85
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
