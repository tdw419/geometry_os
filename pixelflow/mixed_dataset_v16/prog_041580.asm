; DESCRIPTION: Places a orange line segment connecting (17, 25) to (292, 177).
; PLAN: r0=17(x1), r1=25(y1), r2=292(x2), r3=177(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 25
LDI r2, 292
LDI r3, 177
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
