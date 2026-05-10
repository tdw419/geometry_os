; DESCRIPTION: Composite: Renders a purple box of size 105x42 starting at (184, 207) then Places a cyan dot at position (474, 223) then Draws a white circle centered at (348, 107) with radius 80.
; PLAN: r0=184(x), r1=207(y), r2=105(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=474(x), r6=223(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=348(x), r11=107(y), r12=80(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 184
LDI r1, 207
LDI r2, 105
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 474
LDI r6, 223
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 348
LDI r11, 107
LDI r12, 80
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
