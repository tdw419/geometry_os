; DESCRIPTION: Places a black 108x96 rectangle at position (88, 139).
; PLAN: r0=88(x), r1=139(y), r2=108(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 139
LDI r2, 108
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
