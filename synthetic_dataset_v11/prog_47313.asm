; DESCRIPTION: Draws a blue line from (68, 237) to (1, 38).
; PLAN: r0=68(x1), r1=237(y1), r2=1(x2), r3=38(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 237
LDI r2, 1
LDI r3, 38
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
