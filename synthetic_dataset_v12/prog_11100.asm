; DESCRIPTION: Renders a magenta line between points (38, 82) and (22, 67).
; PLAN: r0=38(x1), r1=82(y1), r2=22(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 82
LDI r2, 22
LDI r3, 67
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
