; DESCRIPTION: Composite: Sets a single orange pixel at (131, 24) then Places a red circle of radius 29 at center (77, 170) then Renders a orange box of size 104x86 starting at (86, 49).
; PLAN: r0=131(x), r1=24(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=77(x), r6=170(y), r7=29(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=86(x), r11=49(y), r12=104(width), r13=86(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 131
LDI r1, 24
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 77
LDI r6, 170
LDI r7, 29
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 86
LDI r11, 49
LDI r12, 104
LDI r13, 86
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
