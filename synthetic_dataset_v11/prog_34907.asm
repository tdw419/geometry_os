; DESCRIPTION: Creates a orange rectangular region at (178, 40) spanning 76 by 102 pixels.
; PLAN: r0=178(x), r1=40(y), r2=76(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 40
LDI r2, 76
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
