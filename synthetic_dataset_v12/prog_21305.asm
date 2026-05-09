; DESCRIPTION: Creates a white rectangular region at (20, 152) spanning 56 by 39 pixels.
; PLAN: r0=20(x), r1=152(y), r2=56(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 152
LDI r2, 56
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
