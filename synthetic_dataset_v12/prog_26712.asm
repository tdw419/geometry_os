; DESCRIPTION: Creates a white rectangular region at (365, 139) spanning 77 by 29 pixels.
; PLAN: r0=365(x), r1=139(y), r2=77(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 139
LDI r2, 77
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
