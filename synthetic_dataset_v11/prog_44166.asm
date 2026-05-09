; DESCRIPTION: Creates a white rectangular region at (161, 96) spanning 66 by 18 pixels.
; PLAN: r0=161(x), r1=96(y), r2=66(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 96
LDI r2, 66
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
