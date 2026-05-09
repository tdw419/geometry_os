; DESCRIPTION: Places a black 37x58 rectangle at position (384, 99).
; PLAN: r0=384(x), r1=99(y), r2=37(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 99
LDI r2, 37
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
