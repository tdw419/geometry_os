; DESCRIPTION: Composite: Draws a black line from (507, 57) to (231, 5) then Draws a black circle centered at (67, 89) with radius 11.
; PLAN: r0=507(x1), r1=57(y1), r2=231(x2), r3=5(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=67(x), r6=89(y), r7=11(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 507
LDI r1, 57
LDI r2, 231
LDI r3, 5
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 67
LDI r6, 89
LDI r7, 11
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
