; DESCRIPTION: Renders a orange line between points (281, 226) and (315, 218).
; PLAN: r0=281(x1), r1=226(y1), r2=315(x2), r3=218(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 226
LDI r2, 315
LDI r3, 218
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
