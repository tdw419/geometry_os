; DESCRIPTION: Renders a purple line between points (489, 130) and (360, 146).
; PLAN: r0=489(x1), r1=130(y1), r2=360(x2), r3=146(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 130
LDI r2, 360
LDI r3, 146
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
