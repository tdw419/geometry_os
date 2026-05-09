; DESCRIPTION: Renders a purple line between points (4, 99) and (14, 228).
; PLAN: r0=4(x1), r1=99(y1), r2=14(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 99
LDI r2, 14
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
