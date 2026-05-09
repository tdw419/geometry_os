; DESCRIPTION: Composite: Places a black circle of radius 16 at center (38, 56) then Places a white dot at position (88, 45) then Renders a black box of size 117x22 starting at (342, 71).
; PLAN: r0=38(x), r1=56(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=88(x), r6=45(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=342(x), r11=71(y), r12=117(width), r13=22(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 38
LDI r1, 56
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 88
LDI r6, 45
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 342
LDI r11, 71
LDI r12, 117
LDI r13, 22
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
