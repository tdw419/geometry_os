; DESCRIPTION: Places a black 19x100 rectangle at position (23, 156).
; PLAN: r0=23(x), r1=156(y), r2=19(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 156
LDI r2, 19
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
