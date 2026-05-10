; DESCRIPTION: Draws a magenta line from (152, 67) to (297, 85).
; PLAN: r0=152(x1), r1=67(y1), r2=297(x2), r3=85(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 67
LDI r2, 297
LDI r3, 85
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
