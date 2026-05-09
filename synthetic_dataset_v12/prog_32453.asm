; DESCRIPTION: Renders a yellow line between points (53, 8) and (492, 65).
; PLAN: r0=53(x1), r1=8(y1), r2=492(x2), r3=65(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 8
LDI r2, 492
LDI r3, 65
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
