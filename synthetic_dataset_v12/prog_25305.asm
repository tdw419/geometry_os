; DESCRIPTION: Renders a yellow line between points (501, 93) and (213, 96).
; PLAN: r0=501(x1), r1=93(y1), r2=213(x2), r3=96(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 93
LDI r2, 213
LDI r3, 96
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
