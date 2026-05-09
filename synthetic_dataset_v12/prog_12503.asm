; DESCRIPTION: Places a red 97x22 rectangle at position (383, 184).
; PLAN: r0=383(x), r1=184(y), r2=97(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 184
LDI r2, 97
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
