; DESCRIPTION: Places a black 69x44 rectangle at position (159, 50).
; PLAN: r0=159(x), r1=50(y), r2=69(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 50
LDI r2, 69
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
