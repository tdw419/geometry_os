; DESCRIPTION: Creates a orange rectangular region at (74, 77) spanning 12 by 35 pixels.
; PLAN: r0=74(x), r1=77(y), r2=12(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 77
LDI r2, 12
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
