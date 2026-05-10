; DESCRIPTION: Draws a blue line from (478, 113) to (103, 164).
; PLAN: r0=478(x1), r1=113(y1), r2=103(x2), r3=164(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 113
LDI r2, 103
LDI r3, 164
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
