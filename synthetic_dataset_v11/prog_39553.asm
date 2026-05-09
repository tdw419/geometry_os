; DESCRIPTION: Creates a orange rectangular region at (52, 76) spanning 101 by 12 pixels.
; PLAN: r0=52(x), r1=76(y), r2=101(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 76
LDI r2, 101
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
