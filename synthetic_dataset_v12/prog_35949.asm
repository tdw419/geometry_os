; DESCRIPTION: Creates a white rectangular region at (139, 13) spanning 105 by 67 pixels.
; PLAN: r0=139(x), r1=13(y), r2=105(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 13
LDI r2, 105
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
