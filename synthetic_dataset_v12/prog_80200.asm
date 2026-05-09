; DESCRIPTION: Draws a yellow line from (186, 130) to (62, 74).
; PLAN: r0=186(x1), r1=130(y1), r2=62(x2), r3=74(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 130
LDI r2, 62
LDI r3, 74
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
