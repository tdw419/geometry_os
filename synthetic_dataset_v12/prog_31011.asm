; DESCRIPTION: Composite: Places a red 54x87 rectangle at position (93, 140) then Places a green circle of radius 34 at center (238, 53).
; PLAN: r0=93(x), r1=140(y), r2=54(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=238(x), r6=53(y), r7=34(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 93
LDI r1, 140
LDI r2, 54
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 53
LDI r7, 34
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
