; DESCRIPTION: Renders a blue line between points (214, 241) and (226, 240).
; PLAN: r0=214(x1), r1=241(y1), r2=226(x2), r3=240(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 241
LDI r2, 226
LDI r3, 240
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
