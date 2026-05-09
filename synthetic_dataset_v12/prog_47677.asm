; DESCRIPTION: Creates a red rectangular region at (119, 153) spanning 77 by 60 pixels.
; PLAN: r0=119(x), r1=153(y), r2=77(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 153
LDI r2, 77
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
