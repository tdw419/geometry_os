; DESCRIPTION: Renders a magenta line between points (424, 253) and (193, 81).
; PLAN: r0=424(x1), r1=253(y1), r2=193(x2), r3=81(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 253
LDI r2, 193
LDI r3, 81
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
