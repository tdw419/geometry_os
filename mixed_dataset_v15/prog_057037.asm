; DESCRIPTION: Places a black 91x58 rectangle at position (43, 64).
; PLAN: r0=43(x), r1=64(y), r2=91(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 64
LDI r2, 91
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
