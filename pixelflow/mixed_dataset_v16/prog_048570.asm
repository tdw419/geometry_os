; DESCRIPTION: Places a red 85x56 rectangle at position (383, 26).
; PLAN: r0=383(x), r1=26(y), r2=85(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 26
LDI r2, 85
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
