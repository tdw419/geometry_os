; DESCRIPTION: Renders a magenta line between points (253, 151) and (2, 8).
; PLAN: r0=253(x1), r1=151(y1), r2=2(x2), r3=8(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 151
LDI r2, 2
LDI r3, 8
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
