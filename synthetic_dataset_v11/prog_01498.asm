; DESCRIPTION: Draws a green line from (238, 49) to (21, 251).
; PLAN: r0=238(x1), r1=49(y1), r2=21(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 49
LDI r2, 21
LDI r3, 251
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
