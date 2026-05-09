; DESCRIPTION: Draws a blue line from (45, 49) to (189, 223).
; PLAN: r0=45(x1), r1=49(y1), r2=189(x2), r3=223(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 49
LDI r2, 189
LDI r3, 223
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
