; DESCRIPTION: Creates a orange rectangular region at (234, 95) spanning 98 by 78 pixels.
; PLAN: r0=234(x), r1=95(y), r2=98(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 95
LDI r2, 98
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
