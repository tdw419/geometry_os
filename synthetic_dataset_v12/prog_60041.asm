; DESCRIPTION: Renders a orange line between points (417, 151) and (193, 70).
; PLAN: r0=417(x1), r1=151(y1), r2=193(x2), r3=70(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 151
LDI r2, 193
LDI r3, 70
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
