; DESCRIPTION: Places a black 58x96 rectangle at position (43, 63).
; PLAN: r0=43(x), r1=63(y), r2=58(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 63
LDI r2, 58
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
