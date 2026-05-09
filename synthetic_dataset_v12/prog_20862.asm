; DESCRIPTION: Composite: Creates a green circular shape at (413, 139) with radius 67 then Draws a black line from (426, 10) to (284, 167) then Sets a single yellow pixel at (145, 115).
; PLAN: r0=413(x), r1=139(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=426(x1), r6=10(y1), r7=284(x2), r8=167(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=145(x), r11=115(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 413
LDI r1, 139
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 426
LDI r6, 10
LDI r7, 284
LDI r8, 167
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 145
LDI r11, 115
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
