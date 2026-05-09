; DESCRIPTION: Renders a orange line between points (126, 251) and (59, 97).
; PLAN: r0=126(x1), r1=251(y1), r2=59(x2), r3=97(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 251
LDI r2, 59
LDI r3, 97
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
