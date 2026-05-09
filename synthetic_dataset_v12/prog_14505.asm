; DESCRIPTION: Creates a orange rectangular region at (35, 134) spanning 111 by 34 pixels.
; PLAN: r0=35(x), r1=134(y), r2=111(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 134
LDI r2, 111
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
