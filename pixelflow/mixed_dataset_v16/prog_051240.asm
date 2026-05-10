; DESCRIPTION: Creates a white rectangular region at (366, 0) spanning 62 by 112 pixels.
; PLAN: r0=366(x), r1=0(y), r2=62(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 0
LDI r2, 62
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
