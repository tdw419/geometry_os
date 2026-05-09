; DESCRIPTION: Places a blue line segment connecting (461, 206) to (288, 180).
; PLAN: r0=461(x1), r1=206(y1), r2=288(x2), r3=180(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 206
LDI r2, 288
LDI r3, 180
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
