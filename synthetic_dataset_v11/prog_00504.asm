; DESCRIPTION: Renders a magenta line between points (69, 124) and (63, 140).
; PLAN: r0=69(x1), r1=124(y1), r2=63(x2), r3=140(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 124
LDI r2, 63
LDI r3, 140
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
