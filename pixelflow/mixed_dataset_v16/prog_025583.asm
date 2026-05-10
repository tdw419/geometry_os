; DESCRIPTION: Renders a magenta line between points (316, 67) and (150, 8).
; PLAN: r0=316(x1), r1=67(y1), r2=150(x2), r3=8(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 67
LDI r2, 150
LDI r3, 8
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
