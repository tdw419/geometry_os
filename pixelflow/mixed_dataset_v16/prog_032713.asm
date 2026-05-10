; DESCRIPTION: Creates a white rectangular region at (76, 109) spanning 14 by 97 pixels.
; PLAN: r0=76(x), r1=109(y), r2=14(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 109
LDI r2, 14
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
