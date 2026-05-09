; DESCRIPTION: Places a yellow 75x13 rectangle at position (310, 30).
; PLAN: r0=310(x), r1=30(y), r2=75(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 30
LDI r2, 75
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
