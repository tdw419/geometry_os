; DESCRIPTION: Places a orange 61x69 rectangle at position (53, 121).
; PLAN: r0=53(x), r1=121(y), r2=61(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 121
LDI r2, 61
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
