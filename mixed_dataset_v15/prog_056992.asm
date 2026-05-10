; DESCRIPTION: Places a orange line segment connecting (440, 20) to (275, 43).
; PLAN: r0=440(x1), r1=20(y1), r2=275(x2), r3=43(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 20
LDI r2, 275
LDI r3, 43
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
