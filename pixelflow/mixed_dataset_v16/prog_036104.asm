; DESCRIPTION: Composite: Renders a black box of size 11x44 starting at (3, 23) then Renders a black line between points (141, 57) and (318, 249).
; PLAN: r0=3(x), r1=23(y), r2=11(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=141(x1), r6=57(y1), r7=318(x2), r8=249(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 3
LDI r1, 23
LDI r2, 11
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 57
LDI r7, 318
LDI r8, 249
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
