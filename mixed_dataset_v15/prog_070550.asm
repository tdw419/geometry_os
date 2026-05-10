; DESCRIPTION: Places a cyan 69x103 rectangle at position (291, 131).
; PLAN: r0=291(x), r1=131(y), r2=69(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 131
LDI r2, 69
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
