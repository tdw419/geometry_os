; DESCRIPTION: Places a yellow 53x10 rectangle at position (230, 98).
; PLAN: r0=230(x), r1=98(y), r2=53(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 98
LDI r2, 53
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
