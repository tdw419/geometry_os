; DESCRIPTION: Renders a green line between points (68, 192) and (244, 39).
; PLAN: r0=68(x1), r1=192(y1), r2=244(x2), r3=39(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 192
LDI r2, 244
LDI r3, 39
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
