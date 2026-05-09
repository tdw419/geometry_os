; DESCRIPTION: Renders a black line between points (510, 35) and (452, 225).
; PLAN: r0=510(x1), r1=35(y1), r2=452(x2), r3=225(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 35
LDI r2, 452
LDI r3, 225
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
