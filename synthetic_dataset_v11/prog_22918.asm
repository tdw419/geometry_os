; DESCRIPTION: Draws a magenta line from (179, 14) to (67, 224).
; PLAN: r0=179(x1), r1=14(y1), r2=67(x2), r3=224(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 14
LDI r2, 67
LDI r3, 224
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
