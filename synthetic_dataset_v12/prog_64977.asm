; DESCRIPTION: Creates a orange rectangular region at (336, 178) spanning 96 by 62 pixels.
; PLAN: r0=336(x), r1=178(y), r2=96(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 178
LDI r2, 96
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
