; DESCRIPTION: Renders a purple line between points (136, 163) and (108, 228).
; PLAN: r0=136(x1), r1=163(y1), r2=108(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 163
LDI r2, 108
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
