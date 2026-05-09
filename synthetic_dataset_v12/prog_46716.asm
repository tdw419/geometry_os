; DESCRIPTION: Places a black 78x78 rectangle at position (93, 56).
; PLAN: r0=93(x), r1=56(y), r2=78(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 56
LDI r2, 78
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
