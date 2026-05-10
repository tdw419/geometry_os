; DESCRIPTION: Renders a magenta line between points (196, 87) and (274, 61).
; PLAN: r0=196(x1), r1=87(y1), r2=274(x2), r3=61(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 87
LDI r2, 274
LDI r3, 61
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
