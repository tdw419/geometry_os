; DESCRIPTION: Draws a blue line from (10, 96) to (345, 183).
; PLAN: r0=10(x1), r1=96(y1), r2=345(x2), r3=183(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 96
LDI r2, 345
LDI r3, 183
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
