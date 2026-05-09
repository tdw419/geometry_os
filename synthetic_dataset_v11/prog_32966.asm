; DESCRIPTION: Creates a white rectangular region at (60, 68) spanning 80 by 102 pixels.
; PLAN: r0=60(x), r1=68(y), r2=80(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 68
LDI r2, 80
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
