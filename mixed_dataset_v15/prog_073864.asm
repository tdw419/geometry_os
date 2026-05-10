; DESCRIPTION: Places a black 77x25 rectangle at position (421, 93).
; PLAN: r0=421(x), r1=93(y), r2=77(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 93
LDI r2, 77
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
