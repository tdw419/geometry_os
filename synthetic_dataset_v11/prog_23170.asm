; DESCRIPTION: Draws a blue line from (90, 83) to (37, 28).
; PLAN: r0=90(x1), r1=83(y1), r2=37(x2), r3=28(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 83
LDI r2, 37
LDI r3, 28
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
