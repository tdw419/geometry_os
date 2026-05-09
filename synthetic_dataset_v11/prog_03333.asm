; DESCRIPTION: Draws a blue line from (67, 88) to (216, 177).
; PLAN: r0=67(x1), r1=88(y1), r2=216(x2), r3=177(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 88
LDI r2, 216
LDI r3, 177
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
