; DESCRIPTION: Renders a purple line between points (109, 209) and (54, 146).
; PLAN: r0=109(x1), r1=209(y1), r2=54(x2), r3=146(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 209
LDI r2, 54
LDI r3, 146
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
