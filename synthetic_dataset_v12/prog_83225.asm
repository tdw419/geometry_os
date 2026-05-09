; DESCRIPTION: Creates a white rectangular region at (409, 94) spanning 18 by 15 pixels.
; PLAN: r0=409(x), r1=94(y), r2=18(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 94
LDI r2, 18
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
