; DESCRIPTION: Composite: Places a white 10x106 rectangle at position (389, 125) then Places a magenta circle of radius 43 at center (133, 199).
; PLAN: r0=389(x), r1=125(y), r2=10(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=133(x), r6=199(y), r7=43(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 389
LDI r1, 125
LDI r2, 10
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 133
LDI r6, 199
LDI r7, 43
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
