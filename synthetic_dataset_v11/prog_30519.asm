; DESCRIPTION: Creates a orange rectangular region at (78, 121) spanning 38 by 82 pixels.
; PLAN: r0=78(x), r1=121(y), r2=38(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 121
LDI r2, 38
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
