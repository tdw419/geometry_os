; DESCRIPTION: Renders a white box of size 30x82 starting at (257, 29).
; PLAN: r0=257(x), r1=29(y), r2=30(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 29
LDI r2, 30
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
