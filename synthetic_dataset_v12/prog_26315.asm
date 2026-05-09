; DESCRIPTION: Places a black 69x35 rectangle at position (247, 11).
; PLAN: r0=247(x), r1=11(y), r2=69(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 11
LDI r2, 69
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
