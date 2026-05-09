; DESCRIPTION: Draws a blue line from (64, 87) to (500, 38).
; PLAN: r0=64(x1), r1=87(y1), r2=500(x2), r3=38(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 87
LDI r2, 500
LDI r3, 38
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
