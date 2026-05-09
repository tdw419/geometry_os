; DESCRIPTION: Places a black 69x40 rectangle at position (64, 11).
; PLAN: r0=64(x), r1=11(y), r2=69(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 11
LDI r2, 69
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
