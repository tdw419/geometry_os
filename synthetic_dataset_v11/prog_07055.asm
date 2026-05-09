; DESCRIPTION: Composite: . Then Places a black 81x79 rectangle at position (77, 62). Then Places a orange circle of radius 15 at center (159, 128).
; PLAN: r0=77(x), r1=62(y), r2=81(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=159(x), r1=128(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black 81x79 rectangle at position (77, 62).
; PLAN: r0=77(x), r1=62(y), r2=81(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 62
LDI r2, 81
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange circle of radius 15 at center (159, 128).
; PLAN: r0=159(x), r1=128(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 128
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
