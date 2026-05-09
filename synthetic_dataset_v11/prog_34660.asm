; DESCRIPTION: Places a black 19x64 rectangle at position (89, 52).
; PLAN: r0=89(x), r1=52(y), r2=19(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 52
LDI r2, 19
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
