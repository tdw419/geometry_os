; DESCRIPTION: Places a orange line segment connecting (73, 51) to (171, 48).
; PLAN: r0=73(x1), r1=51(y1), r2=171(x2), r3=48(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 51
LDI r2, 171
LDI r3, 48
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
