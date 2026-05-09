; DESCRIPTION: Creates a white rectangular region at (280, 117) spanning 88 by 71 pixels.
; PLAN: r0=280(x), r1=117(y), r2=88(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 117
LDI r2, 88
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
