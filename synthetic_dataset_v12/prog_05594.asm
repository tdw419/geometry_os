; DESCRIPTION: Renders a red line between points (412, 243) and (253, 137).
; PLAN: r0=412(x1), r1=243(y1), r2=253(x2), r3=137(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 243
LDI r2, 253
LDI r3, 137
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
