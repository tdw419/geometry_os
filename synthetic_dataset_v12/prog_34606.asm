; DESCRIPTION: Composite: Creates a black circular shape at (433, 167) with radius 11 then Places a purple dot at position (163, 202) then Renders a purple box of size 71x74 starting at (366, 33).
; PLAN: r0=433(x), r1=167(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=163(x), r6=202(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=366(x), r11=33(y), r12=71(width), r13=74(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 433
LDI r1, 167
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 163
LDI r6, 202
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 366
LDI r11, 33
LDI r12, 71
LDI r13, 74
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
