; DESCRIPTION: Renders a blue line between points (58, 216) and (9, 213).
; PLAN: r0=58(x1), r1=216(y1), r2=9(x2), r3=213(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 216
LDI r2, 9
LDI r3, 213
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
