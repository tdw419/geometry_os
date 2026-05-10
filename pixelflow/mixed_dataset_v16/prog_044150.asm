; DESCRIPTION: Creates a white rectangular region at (268, 90) spanning 67 by 114 pixels.
; PLAN: r0=268(x), r1=90(y), r2=67(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 90
LDI r2, 67
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
