; DESCRIPTION: Renders a magenta line between points (262, 26) and (331, 156).
; PLAN: r0=262(x1), r1=26(y1), r2=331(x2), r3=156(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 26
LDI r2, 331
LDI r3, 156
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
