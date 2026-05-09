; DESCRIPTION: Renders a purple line between points (265, 5) and (18, 70).
; PLAN: r0=265(x1), r1=5(y1), r2=18(x2), r3=70(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 5
LDI r2, 18
LDI r3, 70
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
