; DESCRIPTION: Composite: Draws a white circle centered at (31, 195) with radius 18 then Places a black dot at position (183, 206) then Renders a orange box of size 82x93 starting at (415, 8).
; PLAN: r0=31(x), r1=195(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=183(x), r6=206(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=415(x), r11=8(y), r12=82(width), r13=93(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 31
LDI r1, 195
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 183
LDI r6, 206
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 415
LDI r11, 8
LDI r12, 82
LDI r13, 93
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
