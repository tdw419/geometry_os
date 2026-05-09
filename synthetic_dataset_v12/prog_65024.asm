; DESCRIPTION: Composite: Places a cyan 49x29 rectangle at position (446, 167) then Draws a white circle centered at (325, 160) with radius 51.
; PLAN: r0=446(x), r1=167(y), r2=49(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=325(x), r6=160(y), r7=51(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 446
LDI r1, 167
LDI r2, 49
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 325
LDI r6, 160
LDI r7, 51
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
