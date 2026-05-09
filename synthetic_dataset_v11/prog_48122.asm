; DESCRIPTION: Composite: . Then Places a white 101x106 rectangle at position (37, 6). Then Creates a red circular shape at (155, 119) with radius 61.
; PLAN: r0=37(x), r1=6(y), r2=101(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=155(x), r1=119(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white 101x106 rectangle at position (37, 6).
; PLAN: r0=37(x), r1=6(y), r2=101(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 6
LDI r2, 101
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a red circular shape at (155, 119) with radius 61.
; PLAN: r0=155(x), r1=119(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 119
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
