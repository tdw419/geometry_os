; DESCRIPTION: Places a black 32x56 rectangle at position (238, 43).
; PLAN: r0=238(x), r1=43(y), r2=32(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 43
LDI r2, 32
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
