; DESCRIPTION: Composite: Creates a orange circular shape at (117, 173) with radius 22 then Draws a magenta line from (466, 167) to (11, 116).
; PLAN: r0=117(x), r1=173(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=466(x1), r6=167(y1), r7=11(x2), r8=116(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 117
LDI r1, 173
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 466
LDI r6, 167
LDI r7, 11
LDI r8, 116
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
