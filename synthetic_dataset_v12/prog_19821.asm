; DESCRIPTION: Renders a orange line between points (208, 255) and (29, 53).
; PLAN: r0=208(x1), r1=255(y1), r2=29(x2), r3=53(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 255
LDI r2, 29
LDI r3, 53
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
