; DESCRIPTION: Renders a orange line between points (344, 140) and (229, 180).
; PLAN: r0=344(x1), r1=140(y1), r2=229(x2), r3=180(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 140
LDI r2, 229
LDI r3, 180
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
