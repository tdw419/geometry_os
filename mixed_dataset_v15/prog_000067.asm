; DESCRIPTION: Draws a blue line from (384, 105) to (380, 6).
; PLAN: r0=384(x1), r1=105(y1), r2=380(x2), r3=6(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 105
LDI r2, 380
LDI r3, 6
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
