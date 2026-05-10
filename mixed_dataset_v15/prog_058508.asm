; DESCRIPTION: Draws a blue line from (3, 164) to (442, 71).
; PLAN: r0=3(x1), r1=164(y1), r2=442(x2), r3=71(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 164
LDI r2, 442
LDI r3, 71
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
