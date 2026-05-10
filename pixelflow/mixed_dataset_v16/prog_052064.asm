; DESCRIPTION: Draws a blue line from (195, 214) to (67, 172).
; PLAN: r0=195(x1), r1=214(y1), r2=67(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 214
LDI r2, 67
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
