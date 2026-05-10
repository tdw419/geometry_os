; DESCRIPTION: Composite: Draws a black rectangle at (304, 135) with width 39 and height 100 then Places a yellow dot at position (413, 124) then Places a orange circle of radius 49 at center (225, 57).
; PLAN: r0=304(x), r1=135(y), r2=39(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=413(x), r6=124(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=225(x), r11=57(y), r12=49(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 304
LDI r1, 135
LDI r2, 39
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 124
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 225
LDI r11, 57
LDI r12, 49
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
