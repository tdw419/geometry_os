; DESCRIPTION: Places a red 45x39 rectangle at position (383, 88).
; PLAN: r0=383(x), r1=88(y), r2=45(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 88
LDI r2, 45
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
