; DESCRIPTION: Renders a black line between points (6, 54) and (456, 210).
; PLAN: r0=6(x1), r1=54(y1), r2=456(x2), r3=210(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 54
LDI r2, 456
LDI r3, 210
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
