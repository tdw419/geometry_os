; DESCRIPTION: Creates a orange rectangular region at (52, 56) spanning 60 by 13 pixels.
; PLAN: r0=52(x), r1=56(y), r2=60(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 56
LDI r2, 60
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
