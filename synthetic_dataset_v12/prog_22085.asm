; DESCRIPTION: Composite: Sets a single green pixel at (287, 68) then Places a black 20x71 rectangle at position (342, 167) then Creates a green circular shape at (103, 215) with radius 17.
; PLAN: r0=287(x), r1=68(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=342(x), r6=167(y), r7=20(width), r8=71(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=103(x), r11=215(y), r12=17(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 287
LDI r1, 68
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 342
LDI r6, 167
LDI r7, 20
LDI r8, 71
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 103
LDI r11, 215
LDI r12, 17
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
