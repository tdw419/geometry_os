; DESCRIPTION: Composite: Places a yellow 72x16 rectangle at position (348, 209) then Places a black dot at position (380, 247) then Draws a orange circle centered at (138, 82) with radius 69.
; PLAN: r0=348(x), r1=209(y), r2=72(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=380(x), r6=247(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=138(x), r11=82(y), r12=69(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 348
LDI r1, 209
LDI r2, 72
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 380
LDI r6, 247
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 138
LDI r11, 82
LDI r12, 69
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
