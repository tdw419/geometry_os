; DESCRIPTION: Draws a black line from (139, 189) to (34, 192).
; PLAN: r0=139(x1), r1=189(y1), r2=34(x2), r3=192(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 189
LDI r2, 34
LDI r3, 192
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
