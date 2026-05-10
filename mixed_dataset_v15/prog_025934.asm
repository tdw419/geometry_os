; DESCRIPTION: Composite: Places a yellow 104x65 rectangle at position (39, 180) then Places a red circle of radius 19 at center (342, 123) then Places a orange dot at position (351, 12).
; PLAN: r0=39(x), r1=180(y), r2=104(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=342(x), r6=123(y), r7=19(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=351(x), r11=12(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 39
LDI r1, 180
LDI r2, 104
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 123
LDI r7, 19
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 351
LDI r11, 12
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
