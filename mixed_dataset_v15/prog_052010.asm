; DESCRIPTION: Draws a blue line from (383, 179) to (5, 50).
; PLAN: r0=383(x1), r1=179(y1), r2=5(x2), r3=50(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 179
LDI r2, 5
LDI r3, 50
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
