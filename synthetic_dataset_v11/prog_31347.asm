; DESCRIPTION: Renders a black line between points (225, 128) and (188, 73).
; PLAN: r0=225(x1), r1=128(y1), r2=188(x2), r3=73(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 128
LDI r2, 188
LDI r3, 73
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
