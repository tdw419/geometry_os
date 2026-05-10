; DESCRIPTION: Renders a magenta line between points (411, 27) and (328, 67).
; PLAN: r0=411(x1), r1=27(y1), r2=328(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 27
LDI r2, 328
LDI r3, 67
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
