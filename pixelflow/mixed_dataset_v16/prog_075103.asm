; DESCRIPTION: Creates a orange rectangular region at (167, 106) spanning 117 by 108 pixels.
; PLAN: r0=167(x), r1=106(y), r2=117(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 106
LDI r2, 117
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
