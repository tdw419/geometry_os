; DESCRIPTION: Renders a yellow line between points (24, 96) and (150, 49).
; PLAN: r0=24(x1), r1=96(y1), r2=150(x2), r3=49(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 96
LDI r2, 150
LDI r3, 49
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
