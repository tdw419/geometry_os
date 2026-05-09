; DESCRIPTION: Renders a black line between points (49, 66) and (386, 211).
; PLAN: r0=49(x1), r1=66(y1), r2=386(x2), r3=211(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 66
LDI r2, 386
LDI r3, 211
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
