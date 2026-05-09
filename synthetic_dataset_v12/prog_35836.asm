; DESCRIPTION: Creates a white rectangular region at (402, 139) spanning 46 by 70 pixels.
; PLAN: r0=402(x), r1=139(y), r2=46(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 139
LDI r2, 46
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
