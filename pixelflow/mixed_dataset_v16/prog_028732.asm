; DESCRIPTION: Creates a white rectangular region at (462, 92) spanning 46 by 105 pixels.
; PLAN: r0=462(x), r1=92(y), r2=46(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 92
LDI r2, 46
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
