; DESCRIPTION: Composite: Draws a orange rectangle at (385, 76) with width 31 and height 83 then Places a cyan dot at position (374, 57) then Renders a red disk with center (373, 57) and radius 39.
; PLAN: r0=385(x), r1=76(y), r2=31(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=374(x), r6=57(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=373(x), r11=57(y), r12=39(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 385
LDI r1, 76
LDI r2, 31
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 57
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 373
LDI r11, 57
LDI r12, 39
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
