; DESCRIPTION: Renders a yellow line between points (236, 251) and (154, 254).
; PLAN: r0=236(x1), r1=251(y1), r2=154(x2), r3=254(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 251
LDI r2, 154
LDI r3, 254
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
