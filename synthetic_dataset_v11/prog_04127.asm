; DESCRIPTION: Creates a white rectangular region at (166, 25) spanning 30 by 56 pixels.
; PLAN: r0=166(x), r1=25(y), r2=30(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 25
LDI r2, 30
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
