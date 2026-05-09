; DESCRIPTION: Creates a orange rectangular region at (69, 128) spanning 49 by 49 pixels.
; PLAN: r0=69(x), r1=128(y), r2=49(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 128
LDI r2, 49
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
