; DESCRIPTION: Composite: Draws a orange rectangle at (389, 170) with width 56 and height 83 then Places a red circle of radius 28 at center (202, 185) then Places a green dot at position (13, 69).
; PLAN: r0=389(x), r1=170(y), r2=56(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=202(x), r6=185(y), r7=28(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=13(x), r11=69(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 389
LDI r1, 170
LDI r2, 56
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 185
LDI r7, 28
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 13
LDI r11, 69
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
