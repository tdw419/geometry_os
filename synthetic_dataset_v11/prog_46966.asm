; DESCRIPTION: Renders a magenta line between points (252, 171) and (92, 67).
; PLAN: r0=252(x1), r1=171(y1), r2=92(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 171
LDI r2, 92
LDI r3, 67
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
