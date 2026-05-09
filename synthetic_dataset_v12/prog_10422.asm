; DESCRIPTION: Renders a yellow line between points (33, 255) and (64, 123).
; PLAN: r0=33(x1), r1=255(y1), r2=64(x2), r3=123(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 255
LDI r2, 64
LDI r3, 123
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
