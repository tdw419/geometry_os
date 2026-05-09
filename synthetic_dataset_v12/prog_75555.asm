; DESCRIPTION: Renders a yellow line between points (301, 172) and (269, 237).
; PLAN: r0=301(x1), r1=172(y1), r2=269(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 172
LDI r2, 269
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
