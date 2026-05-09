; DESCRIPTION: Draws a blue line from (2, 29) to (247, 202).
; PLAN: r0=2(x1), r1=29(y1), r2=247(x2), r3=202(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 29
LDI r2, 247
LDI r3, 202
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
