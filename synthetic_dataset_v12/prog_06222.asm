; DESCRIPTION: Places a orange 47x58 rectangle at position (310, 181).
; PLAN: r0=310(x), r1=181(y), r2=47(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 181
LDI r2, 47
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
