; DESCRIPTION: Places a red 69x12 rectangle at position (339, 199).
; PLAN: r0=339(x), r1=199(y), r2=69(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 199
LDI r2, 69
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
