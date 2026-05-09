; DESCRIPTION: Composite: Creates a orange rectangular region at (164, 49) spanning 48 by 50 pixels then Draws a orange circle centered at (432, 84) with radius 71 then Places a red dot at position (197, 227).
; PLAN: r0=164(x), r1=49(y), r2=48(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=432(x), r6=84(y), r7=71(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=197(x), r11=227(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 164
LDI r1, 49
LDI r2, 48
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 84
LDI r7, 71
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 197
LDI r11, 227
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
