; DESCRIPTION: Composite: Sets a single cyan pixel at (284, 87) then Renders a black box of size 64x102 starting at (372, 83) then Places a orange circle of radius 35 at center (318, 153).
; PLAN: r0=284(x), r1=87(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=372(x), r6=83(y), r7=64(width), r8=102(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=318(x), r11=153(y), r12=35(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 284
LDI r1, 87
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 372
LDI r6, 83
LDI r7, 64
LDI r8, 102
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 318
LDI r11, 153
LDI r12, 35
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
