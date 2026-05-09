; DESCRIPTION: Creates a white rectangular region at (366, 138) spanning 77 by 30 pixels.
; PLAN: r0=366(x), r1=138(y), r2=77(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 138
LDI r2, 77
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
