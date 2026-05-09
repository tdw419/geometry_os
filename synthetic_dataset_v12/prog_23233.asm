; DESCRIPTION: Creates a black rectangular region at (67, 78) spanning 70 by 75 pixels.
; PLAN: r0=67(x), r1=78(y), r2=70(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 78
LDI r2, 70
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
