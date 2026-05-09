; DESCRIPTION: Draws a blue line from (28, 230) to (473, 83).
; PLAN: r0=28(x1), r1=230(y1), r2=473(x2), r3=83(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 230
LDI r2, 473
LDI r3, 83
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
