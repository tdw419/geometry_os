; DESCRIPTION: Creates a white rectangular region at (99, 34) spanning 14 by 20 pixels.
; PLAN: r0=99(x), r1=34(y), r2=14(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 34
LDI r2, 14
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
