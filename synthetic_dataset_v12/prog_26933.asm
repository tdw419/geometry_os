; DESCRIPTION: Renders a purple line between points (65, 196) and (11, 50).
; PLAN: r0=65(x1), r1=196(y1), r2=11(x2), r3=50(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 196
LDI r2, 11
LDI r3, 50
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
