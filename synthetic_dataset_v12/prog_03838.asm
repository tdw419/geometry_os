; DESCRIPTION: Composite: Places a green dot at position (77, 86) then Creates a orange circular shape at (165, 111) with radius 45 then Renders a black box of size 105x41 starting at (103, 82).
; PLAN: r0=77(x), r1=86(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=165(x), r6=111(y), r7=45(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=103(x), r11=82(y), r12=105(width), r13=41(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 77
LDI r1, 86
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 165
LDI r6, 111
LDI r7, 45
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 103
LDI r11, 82
LDI r12, 105
LDI r13, 41
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
