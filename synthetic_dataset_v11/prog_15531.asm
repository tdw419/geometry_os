; DESCRIPTION: Renders a purple line between points (213, 166) and (23, 69).
; PLAN: r0=213(x1), r1=166(y1), r2=23(x2), r3=69(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 166
LDI r2, 23
LDI r3, 69
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
