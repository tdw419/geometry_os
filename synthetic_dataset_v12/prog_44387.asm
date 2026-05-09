; DESCRIPTION: Draws a blue line from (282, 31) to (433, 3).
; PLAN: r0=282(x1), r1=31(y1), r2=433(x2), r3=3(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 31
LDI r2, 433
LDI r3, 3
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
