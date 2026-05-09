; DESCRIPTION: Creates a white rectangular region at (49, 140) spanning 60 by 20 pixels.
; PLAN: r0=49(x), r1=140(y), r2=60(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 140
LDI r2, 60
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
