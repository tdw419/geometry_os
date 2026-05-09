; DESCRIPTION: Places a orange line segment connecting (81, 10) to (77, 125).
; PLAN: r0=81(x1), r1=10(y1), r2=77(x2), r3=125(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 10
LDI r2, 77
LDI r3, 125
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
