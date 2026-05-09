; DESCRIPTION: Composite: Draws a white rectangle at (442, 28) with width 68 and height 70 then Places a blue dot at position (86, 69).
; PLAN: r0=442(x), r1=28(y), r2=68(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=86(x), r6=69(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 442
LDI r1, 28
LDI r2, 68
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 69
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
