; DESCRIPTION: Places a orange line segment connecting (77, 111) to (63, 250).
; PLAN: r0=77(x1), r1=111(y1), r2=63(x2), r3=250(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 111
LDI r2, 63
LDI r3, 250
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
