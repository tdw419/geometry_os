; DESCRIPTION: Places a yellow 30x45 rectangle at position (310, 78).
; PLAN: r0=310(x), r1=78(y), r2=30(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 78
LDI r2, 30
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
