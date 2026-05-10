; DESCRIPTION: Renders a blue line between points (205, 167) and (329, 144).
; PLAN: r0=205(x1), r1=167(y1), r2=329(x2), r3=144(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 167
LDI r2, 329
LDI r3, 144
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
