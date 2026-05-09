; DESCRIPTION: Renders a purple line between points (113, 191) and (23, 73).
; PLAN: r0=113(x1), r1=191(y1), r2=23(x2), r3=73(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 191
LDI r2, 23
LDI r3, 73
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
