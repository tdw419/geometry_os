; DESCRIPTION: Places a black 100x97 rectangle at position (327, 10).
; PLAN: r0=327(x), r1=10(y), r2=100(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 10
LDI r2, 100
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
