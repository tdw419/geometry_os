; DESCRIPTION: Draws a magenta line from (196, 67) to (249, 207).
; PLAN: r0=196(x1), r1=67(y1), r2=249(x2), r3=207(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 67
LDI r2, 249
LDI r3, 207
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
