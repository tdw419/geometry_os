; DESCRIPTION: Draws a green line from (16, 85) to (377, 119).
; PLAN: r0=16(x1), r1=85(y1), r2=377(x2), r3=119(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 85
LDI r2, 377
LDI r3, 119
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
