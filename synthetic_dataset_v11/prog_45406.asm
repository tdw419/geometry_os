; DESCRIPTION: Creates a white rectangular region at (191, 28) spanning 18 by 99 pixels.
; PLAN: r0=191(x), r1=28(y), r2=18(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 28
LDI r2, 18
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
