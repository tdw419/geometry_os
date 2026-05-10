; DESCRIPTION: Renders a orange line between points (276, 251) and (59, 180).
; PLAN: r0=276(x1), r1=251(y1), r2=59(x2), r3=180(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 251
LDI r2, 59
LDI r3, 180
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
