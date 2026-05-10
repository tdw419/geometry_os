; DESCRIPTION: Draws a blue line from (8, 206) to (349, 18).
; PLAN: r0=8(x1), r1=206(y1), r2=349(x2), r3=18(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 206
LDI r2, 349
LDI r3, 18
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
