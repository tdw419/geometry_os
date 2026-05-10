; DESCRIPTION: Renders a purple line between points (451, 99) and (410, 221).
; PLAN: r0=451(x1), r1=99(y1), r2=410(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 99
LDI r2, 410
LDI r3, 221
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
