; DESCRIPTION: Places a green line segment connecting (95, 243) to (119, 139).
; PLAN: r0=95(x1), r1=243(y1), r2=119(x2), r3=139(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 243
LDI r2, 119
LDI r3, 139
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
