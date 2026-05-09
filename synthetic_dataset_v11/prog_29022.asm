; DESCRIPTION: Creates a white rectangular region at (71, 63) spanning 72 by 88 pixels.
; PLAN: r0=71(x), r1=63(y), r2=72(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 63
LDI r2, 72
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
