; DESCRIPTION: Creates a red rectangular region at (134, 76) spanning 105 by 27 pixels.
; PLAN: r0=134(x), r1=76(y), r2=105(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 76
LDI r2, 105
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
