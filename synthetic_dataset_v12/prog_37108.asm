; DESCRIPTION: Renders a magenta line between points (430, 203) and (202, 168).
; PLAN: r0=430(x1), r1=203(y1), r2=202(x2), r3=168(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 203
LDI r2, 202
LDI r3, 168
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
