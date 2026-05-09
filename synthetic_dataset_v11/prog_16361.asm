; DESCRIPTION: Creates a white rectangular region at (16, 14) spanning 34 by 12 pixels.
; PLAN: r0=16(x), r1=14(y), r2=34(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 14
LDI r2, 34
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
