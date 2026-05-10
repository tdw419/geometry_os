; DESCRIPTION: Creates a white rectangular region at (310, 139) spanning 23 by 19 pixels.
; PLAN: r0=310(x), r1=139(y), r2=23(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 139
LDI r2, 23
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
