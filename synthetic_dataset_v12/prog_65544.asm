; DESCRIPTION: Creates a white rectangular region at (327, 115) spanning 77 by 26 pixels.
; PLAN: r0=327(x), r1=115(y), r2=77(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 115
LDI r2, 77
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
