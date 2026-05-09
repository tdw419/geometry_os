; DESCRIPTION: Creates a white rectangular region at (69, 46) spanning 56 by 78 pixels.
; PLAN: r0=69(x), r1=46(y), r2=56(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 46
LDI r2, 56
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
