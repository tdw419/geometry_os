; DESCRIPTION: Composite: Sets a single black pixel at (376, 96) then Places a red 23x49 rectangle at position (313, 47) then Renders a red disk with center (115, 117) and radius 41.
; PLAN: r0=376(x), r1=96(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=313(x), r6=47(y), r7=23(width), r8=49(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=115(x), r11=117(y), r12=41(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 376
LDI r1, 96
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 313
LDI r6, 47
LDI r7, 23
LDI r8, 49
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 115
LDI r11, 117
LDI r12, 41
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
