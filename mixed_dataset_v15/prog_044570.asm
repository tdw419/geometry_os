; DESCRIPTION: Places a black 49x60 rectangle at position (333, 22).
; PLAN: r0=333(x), r1=22(y), r2=49(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 22
LDI r2, 49
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
