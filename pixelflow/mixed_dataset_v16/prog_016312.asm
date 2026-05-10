; DESCRIPTION: Creates a orange rectangular region at (384, 72) spanning 101 by 105 pixels.
; PLAN: r0=384(x), r1=72(y), r2=101(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 72
LDI r2, 101
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
