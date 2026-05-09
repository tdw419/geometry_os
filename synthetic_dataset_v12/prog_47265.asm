; DESCRIPTION: Places a black 72x32 rectangle at position (26, 43).
; PLAN: r0=26(x), r1=43(y), r2=72(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 43
LDI r2, 72
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
