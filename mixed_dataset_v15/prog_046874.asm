; DESCRIPTION: Renders a purple line between points (302, 67) and (494, 150).
; PLAN: r0=302(x1), r1=67(y1), r2=494(x2), r3=150(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 67
LDI r2, 494
LDI r3, 150
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
