; DESCRIPTION: Renders a black line between points (30, 39) and (153, 33).
; PLAN: r0=30(x1), r1=39(y1), r2=153(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 39
LDI r2, 153
LDI r3, 33
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
