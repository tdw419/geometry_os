; DESCRIPTION: Draws a blue line from (10, 24) to (178, 81).
; PLAN: r0=10(x1), r1=24(y1), r2=178(x2), r3=81(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 24
LDI r2, 178
LDI r3, 81
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
