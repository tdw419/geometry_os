; DESCRIPTION: Creates a red rectangular region at (301, 113) spanning 102 by 31 pixels.
; PLAN: r0=301(x), r1=113(y), r2=102(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 113
LDI r2, 102
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
