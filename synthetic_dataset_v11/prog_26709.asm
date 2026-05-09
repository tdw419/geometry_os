; DESCRIPTION: Creates a white rectangular region at (115, 30) spanning 108 by 116 pixels.
; PLAN: r0=115(x), r1=30(y), r2=108(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 30
LDI r2, 108
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
