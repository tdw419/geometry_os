; DESCRIPTION: Renders a magenta line between points (241, 246) and (440, 67).
; PLAN: r0=241(x1), r1=246(y1), r2=440(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 246
LDI r2, 440
LDI r3, 67
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
