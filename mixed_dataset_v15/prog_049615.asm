; DESCRIPTION: Composite: Draws a black line from (474, 243) to (67, 13) then Sets a single black pixel at (38, 66).
; PLAN: r0=474(x1), r1=243(y1), r2=67(x2), r3=13(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=38(x), r6=66(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 474
LDI r1, 243
LDI r2, 67
LDI r3, 13
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 38
LDI r6, 66
LDI r7, 0x000000
PSET r5, r6, r7
HALT
