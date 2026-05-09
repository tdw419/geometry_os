; DESCRIPTION: Places a black 73x14 rectangle at position (151, 123).
; PLAN: r0=151(x), r1=123(y), r2=73(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 123
LDI r2, 73
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
