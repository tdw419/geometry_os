; DESCRIPTION: Renders a purple line between points (410, 209) and (10, 205).
; PLAN: r0=410(x1), r1=209(y1), r2=10(x2), r3=205(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 209
LDI r2, 10
LDI r3, 205
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
