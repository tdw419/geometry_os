; DESCRIPTION: Creates a red rectangular region at (55, 77) spanning 91 by 30 pixels.
; PLAN: r0=55(x), r1=77(y), r2=91(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 77
LDI r2, 91
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
