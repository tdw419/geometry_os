; DESCRIPTION: Creates a white rectangular region at (148, 78) spanning 86 by 10 pixels.
; PLAN: r0=148(x), r1=78(y), r2=86(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 78
LDI r2, 86
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
