; DESCRIPTION: Composite: Places a red dot at position (411, 115) then Places a purple circle of radius 74 at center (105, 170) then Places a white 31x91 rectangle at position (430, 26).
; PLAN: r0=411(x), r1=115(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=105(x), r6=170(y), r7=74(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=430(x), r11=26(y), r12=31(width), r13=91(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 411
LDI r1, 115
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 105
LDI r6, 170
LDI r7, 74
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 430
LDI r11, 26
LDI r12, 31
LDI r13, 91
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
