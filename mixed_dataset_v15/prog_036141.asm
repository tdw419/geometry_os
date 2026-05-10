; DESCRIPTION: Creates a orange rectangular region at (336, 2) spanning 16 by 97 pixels.
; PLAN: r0=336(x), r1=2(y), r2=16(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 2
LDI r2, 16
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
