; DESCRIPTION: Draws a blue line from (18, 177) to (67, 84).
; PLAN: r0=18(x1), r1=177(y1), r2=67(x2), r3=84(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 177
LDI r2, 67
LDI r3, 84
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
