; DESCRIPTION: Places a black 38x83 rectangle at position (339, 101).
; PLAN: r0=339(x), r1=101(y), r2=38(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 101
LDI r2, 38
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
