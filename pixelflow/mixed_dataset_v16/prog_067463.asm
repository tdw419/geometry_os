; DESCRIPTION: Creates a white rectangular region at (27, 60) spanning 77 by 97 pixels.
; PLAN: r0=27(x), r1=60(y), r2=77(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 60
LDI r2, 77
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
