; DESCRIPTION: Draws a magenta line from (456, 37) to (238, 119).
; PLAN: r0=456(x1), r1=37(y1), r2=238(x2), r3=119(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 37
LDI r2, 238
LDI r3, 119
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
