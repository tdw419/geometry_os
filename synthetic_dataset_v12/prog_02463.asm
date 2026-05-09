; DESCRIPTION: Renders a black line between points (65, 170) and (209, 22).
; PLAN: r0=65(x1), r1=170(y1), r2=209(x2), r3=22(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 170
LDI r2, 209
LDI r3, 22
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
