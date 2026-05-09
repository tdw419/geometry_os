; DESCRIPTION: Places a orange line segment connecting (121, 199) to (43, 125).
; PLAN: r0=121(x1), r1=199(y1), r2=43(x2), r3=125(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 199
LDI r2, 43
LDI r3, 125
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
