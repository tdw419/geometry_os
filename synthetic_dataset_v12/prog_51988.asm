; DESCRIPTION: Renders a yellow line between points (379, 192) and (383, 19).
; PLAN: r0=379(x1), r1=192(y1), r2=383(x2), r3=19(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 192
LDI r2, 383
LDI r3, 19
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
