; DESCRIPTION: Creates a white rectangular region at (28, 46) spanning 107 by 55 pixels.
; PLAN: r0=28(x), r1=46(y), r2=107(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 46
LDI r2, 107
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
