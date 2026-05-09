; DESCRIPTION: Places a green 26x108 rectangle at position (107, 45).
; PLAN: r0=107(x), r1=45(y), r2=26(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 45
LDI r2, 26
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
