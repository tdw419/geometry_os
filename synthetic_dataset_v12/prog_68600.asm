; DESCRIPTION: Creates a orange rectangular region at (14, 22) spanning 112 by 77 pixels.
; PLAN: r0=14(x), r1=22(y), r2=112(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 22
LDI r2, 112
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
