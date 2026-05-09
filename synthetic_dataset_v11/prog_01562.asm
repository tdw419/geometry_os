; DESCRIPTION: Creates a orange rectangular region at (155, 161) spanning 96 by 95 pixels.
; PLAN: r0=155(x), r1=161(y), r2=96(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 161
LDI r2, 96
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
