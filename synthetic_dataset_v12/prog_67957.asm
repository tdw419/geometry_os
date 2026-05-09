; DESCRIPTION: Creates a purple rectangular region at (334, 130) spanning 30 by 61 pixels.
; PLAN: r0=334(x), r1=130(y), r2=30(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 130
LDI r2, 30
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
