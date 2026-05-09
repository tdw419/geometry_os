; DESCRIPTION: Creates a orange rectangular region at (291, 141) spanning 56 by 102 pixels.
; PLAN: r0=291(x), r1=141(y), r2=56(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 141
LDI r2, 56
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
