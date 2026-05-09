; DESCRIPTION: Renders a purple line between points (102, 206) and (62, 210).
; PLAN: r0=102(x1), r1=206(y1), r2=62(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 206
LDI r2, 62
LDI r3, 210
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
