; DESCRIPTION: Renders a yellow line between points (247, 77) and (222, 244).
; PLAN: r0=247(x1), r1=77(y1), r2=222(x2), r3=244(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 77
LDI r2, 222
LDI r3, 244
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
