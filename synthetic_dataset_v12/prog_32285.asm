; DESCRIPTION: Creates a orange rectangular region at (326, 62) spanning 32 by 58 pixels.
; PLAN: r0=326(x), r1=62(y), r2=32(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 62
LDI r2, 32
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
