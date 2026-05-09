; DESCRIPTION: Draws a green line from (238, 110) to (24, 68).
; PLAN: r0=238(x1), r1=110(y1), r2=24(x2), r3=68(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 110
LDI r2, 24
LDI r3, 68
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
