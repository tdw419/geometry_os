; DESCRIPTION: Creates a white rectangular region at (70, 67) spanning 101 by 102 pixels.
; PLAN: r0=70(x), r1=67(y), r2=101(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 67
LDI r2, 101
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
