; DESCRIPTION: Creates a white rectangular region at (13, 71) spanning 88 by 54 pixels.
; PLAN: r0=13(x), r1=71(y), r2=88(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 71
LDI r2, 88
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
