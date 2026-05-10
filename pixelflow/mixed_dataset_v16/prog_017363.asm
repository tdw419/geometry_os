; DESCRIPTION: Composite: Draws a cyan circle centered at (193, 95) with radius 78 then Places a white 81x29 rectangle at position (376, 225).
; PLAN: r0=193(x), r1=95(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=376(x), r6=225(y), r7=81(width), r8=29(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 193
LDI r1, 95
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 376
LDI r6, 225
LDI r7, 81
LDI r8, 29
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
