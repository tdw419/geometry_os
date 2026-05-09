; DESCRIPTION: Places a yellow 53x36 rectangle at position (119, 165).
; PLAN: r0=119(x), r1=165(y), r2=53(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 165
LDI r2, 53
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
