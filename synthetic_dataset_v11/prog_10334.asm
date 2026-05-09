; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (128, 26) with radius 11. Then Places a white 29x96 rectangle at position (103, 72).
; PLAN: r0=128(x), r1=26(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=103(x), r1=72(y), r2=29(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow circular shape at (128, 26) with radius 11.
; PLAN: r0=128(x), r1=26(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 26
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white 29x96 rectangle at position (103, 72).
; PLAN: r0=103(x), r1=72(y), r2=29(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 72
LDI r2, 29
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
