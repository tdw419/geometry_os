; DESCRIPTION: Draws a magenta line from (167, 154) to (67, 212).
; PLAN: r0=167(x1), r1=154(y1), r2=67(x2), r3=212(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 154
LDI r2, 67
LDI r3, 212
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
