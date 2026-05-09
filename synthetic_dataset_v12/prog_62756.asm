; DESCRIPTION: Places a blue 81x46 rectangle at position (257, 172).
; PLAN: r0=257(x), r1=172(y), r2=81(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 172
LDI r2, 81
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
