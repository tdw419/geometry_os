; DESCRIPTION: Creates a white rectangular region at (437, 46) spanning 71 by 20 pixels.
; PLAN: r0=437(x), r1=46(y), r2=71(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 46
LDI r2, 71
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
