; DESCRIPTION: Renders a yellow line between points (4, 225) and (198, 237).
; PLAN: r0=4(x1), r1=225(y1), r2=198(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 225
LDI r2, 198
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
