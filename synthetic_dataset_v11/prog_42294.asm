; DESCRIPTION: Renders a magenta line between points (146, 48) and (191, 124).
; PLAN: r0=146(x1), r1=48(y1), r2=191(x2), r3=124(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 48
LDI r2, 191
LDI r3, 124
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
