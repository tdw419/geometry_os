; DESCRIPTION: Creates a cyan rectangular region at (383, 118) spanning 71 by 36 pixels.
; PLAN: r0=383(x), r1=118(y), r2=71(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 118
LDI r2, 71
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
