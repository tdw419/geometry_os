; DESCRIPTION: Renders a purple line between points (68, 200) and (259, 166).
; PLAN: r0=68(x1), r1=200(y1), r2=259(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 200
LDI r2, 259
LDI r3, 166
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
