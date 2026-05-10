; DESCRIPTION: Renders a white box of size 99x21 starting at (257, 81).
; PLAN: r0=257(x), r1=81(y), r2=99(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 81
LDI r2, 99
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
