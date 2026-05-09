; DESCRIPTION: Creates a cyan rectangular region at (383, 158) spanning 15 by 61 pixels.
; PLAN: r0=383(x), r1=158(y), r2=15(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 158
LDI r2, 15
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
