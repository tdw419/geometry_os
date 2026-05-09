; DESCRIPTION: Places a yellow 53x82 rectangle at position (231, 89).
; PLAN: r0=231(x), r1=89(y), r2=53(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 89
LDI r2, 53
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
