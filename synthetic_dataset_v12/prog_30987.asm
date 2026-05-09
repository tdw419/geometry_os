; DESCRIPTION: Draws a blue line from (253, 67) to (420, 153).
; PLAN: r0=253(x1), r1=67(y1), r2=420(x2), r3=153(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 67
LDI r2, 420
LDI r3, 153
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
