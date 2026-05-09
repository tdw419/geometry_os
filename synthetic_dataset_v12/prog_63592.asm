; DESCRIPTION: Creates a purple rectangular region at (383, 0) spanning 57 by 77 pixels.
; PLAN: r0=383(x), r1=0(y), r2=57(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 0
LDI r2, 57
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
