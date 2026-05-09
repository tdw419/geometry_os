; DESCRIPTION: Creates a orange rectangular region at (309, 21) spanning 28 by 39 pixels.
; PLAN: r0=309(x), r1=21(y), r2=28(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 21
LDI r2, 28
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
