; DESCRIPTION: Composite: Places a black dot at position (365, 60) then Renders a white box of size 52x50 starting at (124, 97) then Places a black circle of radius 80 at center (85, 122).
; PLAN: r0=365(x), r1=60(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=124(x), r6=97(y), r7=52(width), r8=50(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=85(x), r11=122(y), r12=80(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 365
LDI r1, 60
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 124
LDI r6, 97
LDI r7, 52
LDI r8, 50
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 85
LDI r11, 122
LDI r12, 80
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
