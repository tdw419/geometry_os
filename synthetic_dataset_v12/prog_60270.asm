; DESCRIPTION: Draws a blue line from (184, 95) to (384, 23).
; PLAN: r0=184(x1), r1=95(y1), r2=384(x2), r3=23(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 95
LDI r2, 384
LDI r3, 23
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
