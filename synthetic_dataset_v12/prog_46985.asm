; DESCRIPTION: Places a orange line segment connecting (125, 140) to (481, 63).
; PLAN: r0=125(x1), r1=140(y1), r2=481(x2), r3=63(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 140
LDI r2, 481
LDI r3, 63
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
