; DESCRIPTION: Creates a white rectangular region at (5, 130) spanning 71 by 60 pixels.
; PLAN: r0=5(x), r1=130(y), r2=71(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 130
LDI r2, 71
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
