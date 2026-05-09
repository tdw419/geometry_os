; DESCRIPTION: Places a orange line segment connecting (111, 193) to (156, 202).
; PLAN: r0=111(x1), r1=193(y1), r2=156(x2), r3=202(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 193
LDI r2, 156
LDI r3, 202
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
