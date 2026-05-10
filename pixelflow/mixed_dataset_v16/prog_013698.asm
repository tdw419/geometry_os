; DESCRIPTION: Composite: Draws a red circle centered at (83, 106) with radius 78 then Sets a single black pixel at (356, 123) then Places a cyan 98x80 rectangle at position (352, 20).
; PLAN: r0=83(x), r1=106(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=356(x), r6=123(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=352(x), r11=20(y), r12=98(width), r13=80(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 83
LDI r1, 106
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 356
LDI r6, 123
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 352
LDI r11, 20
LDI r12, 98
LDI r13, 80
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
