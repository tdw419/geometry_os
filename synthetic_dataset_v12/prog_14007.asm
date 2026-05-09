; DESCRIPTION: Renders a yellow line between points (213, 24) and (270, 205).
; PLAN: r0=213(x1), r1=24(y1), r2=270(x2), r3=205(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 24
LDI r2, 270
LDI r3, 205
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
