; DESCRIPTION: Composite: Places a cyan 30x35 rectangle at position (351, 221) then Places a blue dot at position (386, 82) then Draws a purple circle centered at (474, 177) with radius 23.
; PLAN: r0=351(x), r1=221(y), r2=30(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=386(x), r6=82(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=474(x), r11=177(y), r12=23(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 351
LDI r1, 221
LDI r2, 30
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 386
LDI r6, 82
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 474
LDI r11, 177
LDI r12, 23
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
