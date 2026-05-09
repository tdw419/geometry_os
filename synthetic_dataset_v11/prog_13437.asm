; DESCRIPTION: Renders a yellow line between points (185, 237) and (222, 220).
; PLAN: r0=185(x1), r1=237(y1), r2=222(x2), r3=220(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 237
LDI r2, 222
LDI r3, 220
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
