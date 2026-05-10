; DESCRIPTION: Creates a white rectangular region at (67, 107) spanning 76 by 97 pixels.
; PLAN: r0=67(x), r1=107(y), r2=76(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 107
LDI r2, 76
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
