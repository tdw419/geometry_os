; DESCRIPTION: Creates a red rectangular region at (254, 62) spanning 107 by 72 pixels.
; PLAN: r0=254(x), r1=62(y), r2=107(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 62
LDI r2, 107
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
