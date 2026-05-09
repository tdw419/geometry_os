; DESCRIPTION: Places a magenta 27x76 rectangle at position (257, 166).
; PLAN: r0=257(x), r1=166(y), r2=27(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 166
LDI r2, 27
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
