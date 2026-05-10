; DESCRIPTION: Composite: Places a blue circle of radius 72 at center (157, 107) then Places a red 102x72 rectangle at position (183, 23).
; PLAN: r0=157(x), r1=107(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=183(x), r6=23(y), r7=102(width), r8=72(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 157
LDI r1, 107
LDI r2, 72
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 183
LDI r6, 23
LDI r7, 102
LDI r8, 72
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
