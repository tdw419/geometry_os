; DESCRIPTION: Composite: Draws a magenta rectangle at (29, 126) with width 32 and height 70 then Places a green dot at position (52, 88).
; PLAN: r0=29(x), r1=126(y), r2=32(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=52(x), r6=88(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 29
LDI r1, 126
LDI r2, 32
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 52
LDI r6, 88
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
