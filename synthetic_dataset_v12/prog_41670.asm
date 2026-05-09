; DESCRIPTION: Renders a yellow line between points (73, 162) and (320, 115).
; PLAN: r0=73(x1), r1=162(y1), r2=320(x2), r3=115(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 162
LDI r2, 320
LDI r3, 115
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
