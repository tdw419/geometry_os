; DESCRIPTION: Composite: Sets a single yellow pixel at (56, 32) then Draws a cyan rectangle at (266, 169) with width 45 and height 50 then Places a black circle of radius 74 at center (405, 163).
; PLAN: r0=56(x), r1=32(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=266(x), r6=169(y), r7=45(width), r8=50(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=405(x), r11=163(y), r12=74(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 56
LDI r1, 32
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 266
LDI r6, 169
LDI r7, 45
LDI r8, 50
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 405
LDI r11, 163
LDI r12, 74
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
