; DESCRIPTION: Renders a magenta line between points (14, 8) and (213, 75).
; PLAN: r0=14(x1), r1=8(y1), r2=213(x2), r3=75(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 8
LDI r2, 213
LDI r3, 75
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
