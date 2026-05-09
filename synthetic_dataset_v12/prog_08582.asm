; DESCRIPTION: Places a blue 69x100 rectangle at position (165, 41).
; PLAN: r0=165(x), r1=41(y), r2=69(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 41
LDI r2, 69
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
