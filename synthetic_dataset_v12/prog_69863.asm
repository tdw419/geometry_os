; DESCRIPTION: Places a blue 117x17 rectangle at position (257, 109).
; PLAN: r0=257(x), r1=109(y), r2=117(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 109
LDI r2, 117
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
