; DESCRIPTION: Creates a red rectangular region at (37, 56) spanning 71 by 100 pixels.
; PLAN: r0=37(x), r1=56(y), r2=71(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 56
LDI r2, 71
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
