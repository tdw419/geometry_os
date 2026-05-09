; DESCRIPTION: Renders a magenta line between points (124, 14) and (42, 99).
; PLAN: r0=124(x1), r1=14(y1), r2=42(x2), r3=99(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 14
LDI r2, 42
LDI r3, 99
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
