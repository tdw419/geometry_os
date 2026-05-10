; DESCRIPTION: Composite: Places a blue dot at position (122, 31) then Draws a yellow circle centered at (51, 228) with radius 25 then Places a yellow 64x26 rectangle at position (241, 123).
; PLAN: r0=122(x), r1=31(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=51(x), r6=228(y), r7=25(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=241(x), r11=123(y), r12=64(width), r13=26(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 122
LDI r1, 31
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 51
LDI r6, 228
LDI r7, 25
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 241
LDI r11, 123
LDI r12, 64
LDI r13, 26
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
