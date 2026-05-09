; DESCRIPTION: Draws a blue line from (386, 95) to (478, 101).
; PLAN: r0=386(x1), r1=95(y1), r2=478(x2), r3=101(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 95
LDI r2, 478
LDI r3, 101
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
