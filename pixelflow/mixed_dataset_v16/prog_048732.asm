; DESCRIPTION: Places a red 69x104 rectangle at position (53, 148).
; PLAN: r0=53(x), r1=148(y), r2=69(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 148
LDI r2, 69
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
