; DESCRIPTION: Places a red 69x92 rectangle at position (371, 139).
; PLAN: r0=371(x), r1=139(y), r2=69(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 139
LDI r2, 69
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
