; DESCRIPTION: Creates a white rectangular region at (120, 130) spanning 56 by 90 pixels.
; PLAN: r0=120(x), r1=130(y), r2=56(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 130
LDI r2, 56
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
