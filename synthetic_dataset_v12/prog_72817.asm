; DESCRIPTION: Draws a blue line from (42, 110) to (139, 133).
; PLAN: r0=42(x1), r1=110(y1), r2=139(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 110
LDI r2, 139
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
