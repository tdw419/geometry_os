; DESCRIPTION: Creates a green rectangular region at (334, 90) spanning 67 by 66 pixels.
; PLAN: r0=334(x), r1=90(y), r2=67(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 90
LDI r2, 67
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
