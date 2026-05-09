; DESCRIPTION: Creates a orange rectangular region at (217, 0) spanning 105 by 102 pixels.
; PLAN: r0=217(x), r1=0(y), r2=105(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 0
LDI r2, 105
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
