; DESCRIPTION: Renders a black line between points (342, 166) and (473, 34).
; PLAN: r0=342(x1), r1=166(y1), r2=473(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 166
LDI r2, 473
LDI r3, 34
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
