; DESCRIPTION: Creates a white rectangular region at (170, 30) spanning 40 by 76 pixels.
; PLAN: r0=170(x), r1=30(y), r2=40(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 30
LDI r2, 40
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
