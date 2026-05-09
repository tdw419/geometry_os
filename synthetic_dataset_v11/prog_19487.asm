; DESCRIPTION: Renders a magenta line between points (27, 89) and (28, 195).
; PLAN: r0=27(x1), r1=89(y1), r2=28(x2), r3=195(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 89
LDI r2, 28
LDI r3, 195
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
