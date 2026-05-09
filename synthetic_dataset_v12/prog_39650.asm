; DESCRIPTION: Creates a white rectangular region at (134, 80) spanning 14 by 33 pixels.
; PLAN: r0=134(x), r1=80(y), r2=14(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 80
LDI r2, 14
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
