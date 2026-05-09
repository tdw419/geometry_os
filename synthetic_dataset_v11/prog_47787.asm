; DESCRIPTION: Draws a blue line from (200, 223) to (30, 173).
; PLAN: r0=200(x1), r1=223(y1), r2=30(x2), r3=173(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 223
LDI r2, 30
LDI r3, 173
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
