; DESCRIPTION: Places a black 30x71 rectangle at position (189, 49).
; PLAN: r0=189(x), r1=49(y), r2=30(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 49
LDI r2, 30
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
