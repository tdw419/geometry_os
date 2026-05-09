; DESCRIPTION: Renders a yellow line between points (255, 53) and (123, 137).
; PLAN: r0=255(x1), r1=53(y1), r2=123(x2), r3=137(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 53
LDI r2, 123
LDI r3, 137
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
