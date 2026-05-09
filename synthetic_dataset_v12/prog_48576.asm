; DESCRIPTION: Places a red 118x71 rectangle at position (383, 71).
; PLAN: r0=383(x), r1=71(y), r2=118(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 71
LDI r2, 118
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
