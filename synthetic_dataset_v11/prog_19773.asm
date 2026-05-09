; DESCRIPTION: Renders a purple line between points (146, 48) and (60, 158).
; PLAN: r0=146(x1), r1=48(y1), r2=60(x2), r3=158(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 48
LDI r2, 60
LDI r3, 158
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
