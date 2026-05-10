; DESCRIPTION: Creates a white rectangular region at (306, 130) spanning 49 by 47 pixels.
; PLAN: r0=306(x), r1=130(y), r2=49(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 130
LDI r2, 49
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
