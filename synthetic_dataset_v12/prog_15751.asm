; DESCRIPTION: Renders a green line between points (244, 125) and (222, 139).
; PLAN: r0=244(x1), r1=125(y1), r2=222(x2), r3=139(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 125
LDI r2, 222
LDI r3, 139
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
