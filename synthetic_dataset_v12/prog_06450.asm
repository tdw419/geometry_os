; DESCRIPTION: Composite: Sets a single black pixel at (244, 32) then Draws a green rectangle at (58, 51) with width 97 and height 44.
; PLAN: r0=244(x), r1=32(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=58(x), r6=51(y), r7=97(width), r8=44(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 244
LDI r1, 32
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 58
LDI r6, 51
LDI r7, 97
LDI r8, 44
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
