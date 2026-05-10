; DESCRIPTION: Draws a blue line from (8, 158) to (346, 66).
; PLAN: r0=8(x1), r1=158(y1), r2=346(x2), r3=66(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 158
LDI r2, 346
LDI r3, 66
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
