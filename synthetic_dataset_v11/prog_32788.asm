; DESCRIPTION: Creates a red rectangular region at (109, 76) spanning 43 by 76 pixels.
; PLAN: r0=109(x), r1=76(y), r2=43(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 76
LDI r2, 43
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
