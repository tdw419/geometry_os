; DESCRIPTION: Renders a magenta line between points (328, 11) and (327, 141).
; PLAN: r0=328(x1), r1=11(y1), r2=327(x2), r3=141(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 11
LDI r2, 327
LDI r3, 141
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
