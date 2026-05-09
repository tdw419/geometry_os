; DESCRIPTION: Draws a magenta line from (67, 109) to (69, 14).
; PLAN: r0=67(x1), r1=109(y1), r2=69(x2), r3=14(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 109
LDI r2, 69
LDI r3, 14
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
