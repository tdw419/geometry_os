; DESCRIPTION: Renders a green line between points (375, 125) and (456, 218).
; PLAN: r0=375(x1), r1=125(y1), r2=456(x2), r3=218(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 125
LDI r2, 456
LDI r3, 218
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
