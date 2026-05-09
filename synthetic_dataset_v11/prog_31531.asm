; DESCRIPTION: Composite: . Then Places a orange circle of radius 78 at center (128, 176). Then Places a blue 12x26 rectangle at position (189, 194).
; PLAN: r0=128(x), r1=176(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=189(x), r1=194(y), r2=12(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange circle of radius 78 at center (128, 176).
; PLAN: r0=128(x), r1=176(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 176
LDI r2, 78
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue 12x26 rectangle at position (189, 194).
; PLAN: r0=189(x), r1=194(y), r2=12(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 194
LDI r2, 12
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
