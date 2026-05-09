; DESCRIPTION: Composite: Draws a white rectangle at (151, 64) with width 56 and height 25 then Places a red dot at position (208, 88).
; PLAN: r0=151(x), r1=64(y), r2=56(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=208(x), r6=88(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 151
LDI r1, 64
LDI r2, 56
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 88
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
