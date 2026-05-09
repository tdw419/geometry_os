; DESCRIPTION: Creates a red rectangular region at (337, 109) spanning 62 by 78 pixels.
; PLAN: r0=337(x), r1=109(y), r2=62(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 109
LDI r2, 62
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
