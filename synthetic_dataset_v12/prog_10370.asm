; DESCRIPTION: Composite: Draws a red line from (242, 191) to (481, 200) then Draws a cyan circle centered at (351, 105) with radius 75.
; PLAN: r0=242(x1), r1=191(y1), r2=481(x2), r3=200(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=351(x), r6=105(y), r7=75(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 242
LDI r1, 191
LDI r2, 481
LDI r3, 200
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 351
LDI r6, 105
LDI r7, 75
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
