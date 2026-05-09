; DESCRIPTION: Creates a white rectangular region at (18, 31) spanning 98 by 28 pixels.
; PLAN: r0=18(x), r1=31(y), r2=98(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 31
LDI r2, 98
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
