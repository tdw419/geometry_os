; DESCRIPTION: Creates a red rectangular region at (69, 76) spanning 31 by 71 pixels.
; PLAN: r0=69(x), r1=76(y), r2=31(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 76
LDI r2, 31
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
