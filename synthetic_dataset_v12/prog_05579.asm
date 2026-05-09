; DESCRIPTION: Creates a red rectangular region at (61, 122) spanning 23 by 40 pixels.
; PLAN: r0=61(x), r1=122(y), r2=23(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 122
LDI r2, 23
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
