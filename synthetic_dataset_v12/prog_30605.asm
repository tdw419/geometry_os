; DESCRIPTION: Places a yellow 53x15 rectangle at position (3, 108).
; PLAN: r0=3(x), r1=108(y), r2=53(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 108
LDI r2, 53
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
