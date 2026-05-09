; DESCRIPTION: Creates a white rectangular region at (77, 68) spanning 47 by 98 pixels.
; PLAN: r0=77(x), r1=68(y), r2=47(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 68
LDI r2, 47
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
