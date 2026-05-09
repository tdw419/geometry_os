; DESCRIPTION: Creates a white rectangular region at (279, 2) spanning 76 by 28 pixels.
; PLAN: r0=279(x), r1=2(y), r2=76(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 2
LDI r2, 76
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
