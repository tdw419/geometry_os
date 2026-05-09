; DESCRIPTION: Places a black 119x53 rectangle at position (15, 29).
; PLAN: r0=15(x), r1=29(y), r2=119(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 29
LDI r2, 119
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
