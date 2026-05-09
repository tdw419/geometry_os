; DESCRIPTION: Creates a white rectangular region at (209, 75) spanning 56 by 36 pixels.
; PLAN: r0=209(x), r1=75(y), r2=56(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 75
LDI r2, 56
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
