; DESCRIPTION: Draws a blue line from (148, 250) to (442, 126).
; PLAN: r0=148(x1), r1=250(y1), r2=442(x2), r3=126(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 250
LDI r2, 442
LDI r3, 126
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
