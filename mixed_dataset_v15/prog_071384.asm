; DESCRIPTION: Composite: Draws a blue rectangle at (210, 156) with width 70 and height 18 then Places a white dot at position (280, 83).
; PLAN: r0=210(x), r1=156(y), r2=70(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=280(x), r6=83(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 210
LDI r1, 156
LDI r2, 70
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 83
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
