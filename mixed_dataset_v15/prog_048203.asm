; DESCRIPTION: Creates a red rectangular region at (299, 76) spanning 55 by 56 pixels.
; PLAN: r0=299(x), r1=76(y), r2=55(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 76
LDI r2, 55
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
