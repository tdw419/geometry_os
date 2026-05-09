; DESCRIPTION: Draws a blue line from (74, 30) to (240, 89).
; PLAN: r0=74(x1), r1=30(y1), r2=240(x2), r3=89(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 30
LDI r2, 240
LDI r3, 89
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
