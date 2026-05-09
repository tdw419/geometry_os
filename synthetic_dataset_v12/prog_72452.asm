; DESCRIPTION: Places a black 29x108 rectangle at position (383, 40).
; PLAN: r0=383(x), r1=40(y), r2=29(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 40
LDI r2, 29
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
