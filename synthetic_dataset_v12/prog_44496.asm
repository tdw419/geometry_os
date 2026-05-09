; DESCRIPTION: Renders a black line between points (45, 233) and (175, 36).
; PLAN: r0=45(x1), r1=233(y1), r2=175(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 233
LDI r2, 175
LDI r3, 36
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
