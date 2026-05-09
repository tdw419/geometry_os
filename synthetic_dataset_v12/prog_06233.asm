; DESCRIPTION: Renders a magenta line between points (58, 9) and (228, 148).
; PLAN: r0=58(x1), r1=9(y1), r2=228(x2), r3=148(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 9
LDI r2, 228
LDI r3, 148
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
