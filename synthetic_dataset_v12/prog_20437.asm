; DESCRIPTION: Composite: Sets a single green pixel at (365, 4) then Places a white 18x106 rectangle at position (459, 22) then Places a red circle of radius 72 at center (408, 95).
; PLAN: r0=365(x), r1=4(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=459(x), r6=22(y), r7=18(width), r8=106(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=408(x), r11=95(y), r12=72(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 365
LDI r1, 4
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 459
LDI r6, 22
LDI r7, 18
LDI r8, 106
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 408
LDI r11, 95
LDI r12, 72
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
