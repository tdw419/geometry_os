; DESCRIPTION: Composite: Draws a white rectangle at (142, 156) with width 81 and height 20 then Places a black dot at position (480, 82).
; PLAN: r0=142(x), r1=156(y), r2=81(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=480(x), r6=82(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 142
LDI r1, 156
LDI r2, 81
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 480
LDI r6, 82
LDI r7, 0x000000
PSET r5, r6, r7
HALT
