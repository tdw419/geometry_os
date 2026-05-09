; DESCRIPTION: Places a black 62x82 rectangle at position (26, 11).
; PLAN: r0=26(x), r1=11(y), r2=62(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 11
LDI r2, 62
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
