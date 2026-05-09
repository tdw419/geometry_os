; DESCRIPTION: Composite: Places a cyan dot at position (296, 72) then Draws a green circle centered at (335, 191) with radius 35 then Places a yellow 31x40 rectangle at position (121, 20).
; PLAN: r0=296(x), r1=72(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=335(x), r6=191(y), r7=35(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=121(x), r11=20(y), r12=31(width), r13=40(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 296
LDI r1, 72
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 335
LDI r6, 191
LDI r7, 35
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 121
LDI r11, 20
LDI r12, 31
LDI r13, 40
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
