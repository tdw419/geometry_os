; DESCRIPTION: Places a red 69x103 rectangle at position (85, 35).
; PLAN: r0=85(x), r1=35(y), r2=69(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 35
LDI r2, 69
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
