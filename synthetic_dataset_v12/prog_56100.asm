; DESCRIPTION: Creates a orange rectangular region at (40, 25) spanning 52 by 88 pixels.
; PLAN: r0=40(x), r1=25(y), r2=52(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 25
LDI r2, 52
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
