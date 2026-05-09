; DESCRIPTION: Renders a purple line between points (52, 254) and (410, 28).
; PLAN: r0=52(x1), r1=254(y1), r2=410(x2), r3=28(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 254
LDI r2, 410
LDI r3, 28
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
