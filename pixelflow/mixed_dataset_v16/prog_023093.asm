; DESCRIPTION: Creates a orange rectangular region at (326, 110) spanning 112 by 61 pixels.
; PLAN: r0=326(x), r1=110(y), r2=112(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 110
LDI r2, 112
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
