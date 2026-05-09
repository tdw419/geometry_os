; DESCRIPTION: Renders a magenta line between points (79, 109) and (413, 253).
; PLAN: r0=79(x1), r1=109(y1), r2=413(x2), r3=253(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 109
LDI r2, 413
LDI r3, 253
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
