; DESCRIPTION: Draws a blue line from (296, 2) to (380, 8).
; PLAN: r0=296(x1), r1=2(y1), r2=380(x2), r3=8(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 2
LDI r2, 380
LDI r3, 8
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
