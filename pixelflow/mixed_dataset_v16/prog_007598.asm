; DESCRIPTION: Composite: Places a cyan dot at position (215, 48) then Creates a orange circular shape at (101, 105) with radius 80 then Places a black 98x53 rectangle at position (72, 144).
; PLAN: r0=215(x), r1=48(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=101(x), r6=105(y), r7=80(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=72(x), r11=144(y), r12=98(width), r13=53(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 215
LDI r1, 48
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 101
LDI r6, 105
LDI r7, 80
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 72
LDI r11, 144
LDI r12, 98
LDI r13, 53
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
