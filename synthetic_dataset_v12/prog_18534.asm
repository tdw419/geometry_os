; DESCRIPTION: Renders a green line between points (360, 255) and (258, 216).
; PLAN: r0=360(x1), r1=255(y1), r2=258(x2), r3=216(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 255
LDI r2, 258
LDI r3, 216
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
