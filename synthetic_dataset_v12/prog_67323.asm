; DESCRIPTION: Creates a white rectangular region at (3, 139) spanning 54 by 19 pixels.
; PLAN: r0=3(x), r1=139(y), r2=54(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 139
LDI r2, 54
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
