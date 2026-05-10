; DESCRIPTION: Creates a white rectangular region at (2, 91) spanning 14 by 23 pixels.
; PLAN: r0=2(x), r1=91(y), r2=14(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 91
LDI r2, 14
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
