; DESCRIPTION: Composite: Draws a cyan circle centered at (214, 175) with radius 50 then Places a blue dot at position (26, 166) then Places a orange 30x92 rectangle at position (229, 72).
; PLAN: r0=214(x), r1=175(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=26(x), r6=166(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=229(x), r11=72(y), r12=30(width), r13=92(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 214
LDI r1, 175
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 26
LDI r6, 166
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 229
LDI r11, 72
LDI r12, 30
LDI r13, 92
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
