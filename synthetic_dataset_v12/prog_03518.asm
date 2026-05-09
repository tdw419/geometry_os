; DESCRIPTION: Renders a yellow line between points (144, 214) and (32, 233).
; PLAN: r0=144(x1), r1=214(y1), r2=32(x2), r3=233(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 214
LDI r2, 32
LDI r3, 233
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
