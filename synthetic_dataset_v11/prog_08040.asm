; DESCRIPTION: Draws a green line from (120, 139) to (134, 119).
; PLAN: r0=120(x1), r1=139(y1), r2=134(x2), r3=119(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 139
LDI r2, 134
LDI r3, 119
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
