; DESCRIPTION: Creates a orange rectangular region at (159, 24) spanning 43 by 64 pixels.
; PLAN: r0=159(x), r1=24(y), r2=43(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 24
LDI r2, 43
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
