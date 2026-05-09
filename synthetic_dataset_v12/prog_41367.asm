; DESCRIPTION: Creates a orange rectangular region at (161, 106) spanning 82 by 106 pixels.
; PLAN: r0=161(x), r1=106(y), r2=82(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 106
LDI r2, 82
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
