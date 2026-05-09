; DESCRIPTION: Draws a blue line from (6, 85) to (356, 236).
; PLAN: r0=6(x1), r1=85(y1), r2=356(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 85
LDI r2, 356
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
