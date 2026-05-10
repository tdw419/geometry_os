; DESCRIPTION: Creates a white rectangular region at (108, 101) spanning 14 by 57 pixels.
; PLAN: r0=108(x), r1=101(y), r2=14(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 101
LDI r2, 14
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
