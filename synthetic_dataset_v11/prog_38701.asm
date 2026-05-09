; DESCRIPTION: Places a orange 85x98 rectangle at position (102, 151).
; PLAN: r0=102(x), r1=151(y), r2=85(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 151
LDI r2, 85
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
