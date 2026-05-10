; DESCRIPTION: Renders a magenta line between points (334, 176) and (491, 114).
; PLAN: r0=334(x1), r1=176(y1), r2=491(x2), r3=114(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 176
LDI r2, 491
LDI r3, 114
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
