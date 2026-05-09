; DESCRIPTION: Renders a green line between points (233, 214) and (205, 232).
; PLAN: r0=233(x1), r1=214(y1), r2=205(x2), r3=232(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 214
LDI r2, 205
LDI r3, 232
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
