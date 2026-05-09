; DESCRIPTION: Creates a orange rectangular region at (246, 115) spanning 46 by 62 pixels.
; PLAN: r0=246(x), r1=115(y), r2=46(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 115
LDI r2, 46
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
