; DESCRIPTION: Composite: Creates a green circular shape at (443, 73) with radius 10 then Places a blue dot at position (221, 100) then Places a red 114x78 rectangle at position (58, 15).
; PLAN: r0=443(x), r1=73(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=221(x), r6=100(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=58(x), r11=15(y), r12=114(width), r13=78(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 443
LDI r1, 73
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 221
LDI r6, 100
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 58
LDI r11, 15
LDI r12, 114
LDI r13, 78
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
