; DESCRIPTION: Places a black 13x39 rectangle at position (310, 2).
; PLAN: r0=310(x), r1=2(y), r2=13(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 2
LDI r2, 13
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
