; DESCRIPTION: Draws a blue line from (238, 195) to (13, 95).
; PLAN: r0=238(x1), r1=195(y1), r2=13(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 195
LDI r2, 13
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
