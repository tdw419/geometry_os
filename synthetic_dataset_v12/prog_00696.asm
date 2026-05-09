; DESCRIPTION: Renders a yellow line between points (278, 128) and (233, 152).
; PLAN: r0=278(x1), r1=128(y1), r2=233(x2), r3=152(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 128
LDI r2, 233
LDI r3, 152
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
