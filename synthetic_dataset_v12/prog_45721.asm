; DESCRIPTION: Places a black 83x52 rectangle at position (310, 69).
; PLAN: r0=310(x), r1=69(y), r2=83(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 69
LDI r2, 83
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
