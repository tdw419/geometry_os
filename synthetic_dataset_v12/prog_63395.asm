; DESCRIPTION: Creates a orange rectangular region at (282, 213) spanning 76 by 31 pixels.
; PLAN: r0=282(x), r1=213(y), r2=76(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 213
LDI r2, 76
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
