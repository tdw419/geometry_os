; DESCRIPTION: Renders a magenta line between points (32, 109) and (245, 58).
; PLAN: r0=32(x1), r1=109(y1), r2=245(x2), r3=58(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 109
LDI r2, 245
LDI r3, 58
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
