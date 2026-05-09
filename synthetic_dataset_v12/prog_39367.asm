; DESCRIPTION: Places a orange line segment connecting (247, 240) to (261, 192).
; PLAN: r0=247(x1), r1=240(y1), r2=261(x2), r3=192(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 240
LDI r2, 261
LDI r3, 192
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
