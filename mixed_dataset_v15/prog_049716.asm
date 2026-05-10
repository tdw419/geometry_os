; DESCRIPTION: Places a black 101x53 rectangle at position (30, 46).
; PLAN: r0=30(x), r1=46(y), r2=101(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 46
LDI r2, 101
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
