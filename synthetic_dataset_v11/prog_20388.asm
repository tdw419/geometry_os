; DESCRIPTION: Places a black 102x78 rectangle at position (14, 90).
; PLAN: r0=14(x), r1=90(y), r2=102(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 90
LDI r2, 102
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
