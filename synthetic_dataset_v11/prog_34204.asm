; DESCRIPTION: Places a black 11x114 rectangle at position (156, 48).
; PLAN: r0=156(x), r1=48(y), r2=11(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 48
LDI r2, 11
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
