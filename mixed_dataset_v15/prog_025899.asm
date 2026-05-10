; DESCRIPTION: Draws a blue line from (382, 183) to (420, 50).
; PLAN: r0=382(x1), r1=183(y1), r2=420(x2), r3=50(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 183
LDI r2, 420
LDI r3, 50
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
