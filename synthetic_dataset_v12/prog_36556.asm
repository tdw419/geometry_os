; DESCRIPTION: Creates a orange rectangular region at (32, 101) spanning 24 by 24 pixels.
; PLAN: r0=32(x), r1=101(y), r2=24(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 101
LDI r2, 24
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
