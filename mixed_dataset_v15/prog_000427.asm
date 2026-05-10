; DESCRIPTION: Creates a orange rectangular region at (336, 32) spanning 38 by 101 pixels.
; PLAN: r0=336(x), r1=32(y), r2=38(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 32
LDI r2, 38
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
