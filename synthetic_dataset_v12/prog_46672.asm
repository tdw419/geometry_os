; DESCRIPTION: Creates a red rectangular region at (38, 170) spanning 77 by 48 pixels.
; PLAN: r0=38(x), r1=170(y), r2=77(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 170
LDI r2, 77
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
