; DESCRIPTION: Places a black 32x53 rectangle at position (90, 149).
; PLAN: r0=90(x), r1=149(y), r2=32(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 149
LDI r2, 32
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
