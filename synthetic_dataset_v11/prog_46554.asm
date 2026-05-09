; DESCRIPTION: Renders a purple line between points (56, 194) and (228, 193).
; PLAN: r0=56(x1), r1=194(y1), r2=228(x2), r3=193(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 194
LDI r2, 228
LDI r3, 193
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
