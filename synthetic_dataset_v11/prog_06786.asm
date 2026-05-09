; DESCRIPTION: Places a red line segment connecting (77, 113) to (254, 75).
; PLAN: r0=77(x1), r1=113(y1), r2=254(x2), r3=75(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 113
LDI r2, 254
LDI r3, 75
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
