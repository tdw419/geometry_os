; DESCRIPTION: Creates a white rectangular region at (78, 130) spanning 44 by 14 pixels.
; PLAN: r0=78(x), r1=130(y), r2=44(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 130
LDI r2, 44
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
