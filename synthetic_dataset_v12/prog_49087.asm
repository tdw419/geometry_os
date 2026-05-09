; DESCRIPTION: Renders a purple line between points (108, 151) and (35, 86).
; PLAN: r0=108(x1), r1=151(y1), r2=35(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 151
LDI r2, 35
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
