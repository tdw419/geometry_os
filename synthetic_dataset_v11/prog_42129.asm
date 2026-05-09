; DESCRIPTION: Creates a white rectangular region at (143, 67) spanning 14 by 102 pixels.
; PLAN: r0=143(x), r1=67(y), r2=14(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 67
LDI r2, 14
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
