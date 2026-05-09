; DESCRIPTION: Composite: Sets a single orange pixel at (207, 227) then Draws a purple rectangle at (144, 72) with width 39 and height 72 then Renders a cyan disk with center (134, 94) and radius 67.
; PLAN: r0=207(x), r1=227(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=144(x), r6=72(y), r7=39(width), r8=72(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=134(x), r11=94(y), r12=67(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 207
LDI r1, 227
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 144
LDI r6, 72
LDI r7, 39
LDI r8, 72
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 134
LDI r11, 94
LDI r12, 67
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
