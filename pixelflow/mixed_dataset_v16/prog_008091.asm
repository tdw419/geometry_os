; DESCRIPTION: Creates a green rectangular region at (265, 203) spanning 49 by 47 pixels.
; PLAN: r0=265(x), r1=203(y), r2=49(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 203
LDI r2, 49
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
