; DESCRIPTION: Composite: Places a purple circle of radius 64 at center (358, 89) then Renders a magenta box of size 94x31 starting at (250, 195) then Renders a magenta line between points (399, 117) and (200, 117).
; PLAN: r0=358(x), r1=89(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=250(x), r6=195(y), r7=94(width), r8=31(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=399(x1), r11=117(y1), r12=200(x2), r13=117(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 358
LDI r1, 89
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 250
LDI r6, 195
LDI r7, 94
LDI r8, 31
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 399
LDI r11, 117
LDI r12, 200
LDI r13, 117
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
