; DESCRIPTION: Draws a blue line from (64, 148) to (111, 207).
; PLAN: r0=64(x1), r1=148(y1), r2=111(x2), r3=207(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 148
LDI r2, 111
LDI r3, 207
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
