; DESCRIPTION: Renders a yellow line between points (368, 96) and (323, 255).
; PLAN: r0=368(x1), r1=96(y1), r2=323(x2), r3=255(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 96
LDI r2, 323
LDI r3, 255
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
