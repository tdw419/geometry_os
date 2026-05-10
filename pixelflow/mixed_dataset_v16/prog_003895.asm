; DESCRIPTION: Composite: Places a green dot at position (503, 82) then Draws a black circle centered at (177, 170) with radius 41 then Places a orange 46x15 rectangle at position (45, 124).
; PLAN: r0=503(x), r1=82(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=177(x), r6=170(y), r7=41(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=45(x), r11=124(y), r12=46(width), r13=15(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 503
LDI r1, 82
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 177
LDI r6, 170
LDI r7, 41
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 45
LDI r11, 124
LDI r12, 46
LDI r13, 15
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
