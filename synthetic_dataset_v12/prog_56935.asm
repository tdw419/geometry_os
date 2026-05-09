; DESCRIPTION: Composite: Draws a black line from (509, 216) to (343, 100) then Draws a white circle centered at (258, 150) with radius 74.
; PLAN: r0=509(x1), r1=216(y1), r2=343(x2), r3=100(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=258(x), r6=150(y), r7=74(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 509
LDI r1, 216
LDI r2, 343
LDI r3, 100
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 150
LDI r7, 74
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
