; DESCRIPTION: Renders a magenta line between points (23, 134) and (139, 202).
; PLAN: r0=23(x1), r1=134(y1), r2=139(x2), r3=202(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 134
LDI r2, 139
LDI r3, 202
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
