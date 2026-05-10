; DESCRIPTION: Places a red 53x26 rectangle at position (265, 34).
; PLAN: r0=265(x), r1=34(y), r2=53(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 34
LDI r2, 53
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
