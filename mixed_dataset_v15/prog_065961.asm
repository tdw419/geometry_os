; DESCRIPTION: Composite: Sets a single black pixel at (398, 248) then Draws a black rectangle at (121, 155) with width 105 and height 25.
; PLAN: r0=398(x), r1=248(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=121(x), r6=155(y), r7=105(width), r8=25(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 398
LDI r1, 248
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 121
LDI r6, 155
LDI r7, 105
LDI r8, 25
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
