; DESCRIPTION: Creates a white rectangular region at (90, 34) spanning 11 by 76 pixels.
; PLAN: r0=90(x), r1=34(y), r2=11(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 34
LDI r2, 11
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
