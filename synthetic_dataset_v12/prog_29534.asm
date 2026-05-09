; DESCRIPTION: Creates a orange rectangular region at (12, 113) spanning 83 by 114 pixels.
; PLAN: r0=12(x), r1=113(y), r2=83(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 113
LDI r2, 83
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
