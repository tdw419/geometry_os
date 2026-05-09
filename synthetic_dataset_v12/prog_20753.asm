; DESCRIPTION: Composite: Draws a cyan rectangle at (50, 210) with width 84 and height 34 then Places a red dot at position (225, 67) then Draws a black circle centered at (245, 89) with radius 16.
; PLAN: r0=50(x), r1=210(y), r2=84(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=225(x), r6=67(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=245(x), r11=89(y), r12=16(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 50
LDI r1, 210
LDI r2, 84
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 225
LDI r6, 67
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 245
LDI r11, 89
LDI r12, 16
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
