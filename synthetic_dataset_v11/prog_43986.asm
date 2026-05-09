; DESCRIPTION: Creates a orange rectangular region at (111, 12) spanning 23 by 41 pixels.
; PLAN: r0=111(x), r1=12(y), r2=23(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 12
LDI r2, 23
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
