; DESCRIPTION: Places a orange 53x102 rectangle at position (167, 15).
; PLAN: r0=167(x), r1=15(y), r2=53(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 15
LDI r2, 53
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
