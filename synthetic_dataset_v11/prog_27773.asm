; DESCRIPTION: Places a orange line segment connecting (150, 159) to (136, 210).
; PLAN: r0=150(x1), r1=159(y1), r2=136(x2), r3=210(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 159
LDI r2, 136
LDI r3, 210
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
