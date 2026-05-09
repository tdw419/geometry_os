; DESCRIPTION: Places a black 97x26 rectangle at position (157, 108).
; PLAN: r0=157(x), r1=108(y), r2=97(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 108
LDI r2, 97
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
