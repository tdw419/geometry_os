; DESCRIPTION: Renders a magenta line between points (430, 103) and (138, 32).
; PLAN: r0=430(x1), r1=103(y1), r2=138(x2), r3=32(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 103
LDI r2, 138
LDI r3, 32
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
