; DESCRIPTION: Places a orange line segment connecting (167, 90) to (270, 236).
; PLAN: r0=167(x1), r1=90(y1), r2=270(x2), r3=236(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 90
LDI r2, 270
LDI r3, 236
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
