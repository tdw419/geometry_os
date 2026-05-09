; DESCRIPTION: Draws a blue line from (29, 117) to (236, 38).
; PLAN: r0=29(x1), r1=117(y1), r2=236(x2), r3=38(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 117
LDI r2, 236
LDI r3, 38
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
