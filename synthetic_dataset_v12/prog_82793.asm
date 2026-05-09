; DESCRIPTION: Places a black 89x62 rectangle at position (299, 90).
; PLAN: r0=299(x), r1=90(y), r2=89(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 90
LDI r2, 89
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
