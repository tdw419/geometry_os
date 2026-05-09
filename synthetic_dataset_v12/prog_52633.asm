; DESCRIPTION: Renders a yellow line between points (141, 96) and (332, 246).
; PLAN: r0=141(x1), r1=96(y1), r2=332(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 96
LDI r2, 332
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
