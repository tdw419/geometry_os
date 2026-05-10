; DESCRIPTION: Places a black 76x107 rectangle at position (26, 10).
; PLAN: r0=26(x), r1=10(y), r2=76(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 10
LDI r2, 76
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
