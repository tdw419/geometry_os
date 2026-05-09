; DESCRIPTION: Draws a magenta line from (332, 222) to (67, 117).
; PLAN: r0=332(x1), r1=222(y1), r2=67(x2), r3=117(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 222
LDI r2, 67
LDI r3, 117
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
