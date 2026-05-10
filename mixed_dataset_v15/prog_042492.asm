; DESCRIPTION: Places a black 11x53 rectangle at position (391, 0).
; PLAN: r0=391(x), r1=0(y), r2=11(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 0
LDI r2, 11
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
