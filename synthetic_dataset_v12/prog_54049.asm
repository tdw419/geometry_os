; DESCRIPTION: Composite: Renders a orange box of size 64x114 starting at (82, 126) then Places a blue circle of radius 51 at center (380, 141).
; PLAN: r0=82(x), r1=126(y), r2=64(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=380(x), r6=141(y), r7=51(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 82
LDI r1, 126
LDI r2, 64
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 380
LDI r6, 141
LDI r7, 51
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
