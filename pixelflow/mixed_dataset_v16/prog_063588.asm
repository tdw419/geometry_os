; DESCRIPTION: Creates a orange rectangular region at (288, 13) spanning 89 by 88 pixels.
; PLAN: r0=288(x), r1=13(y), r2=89(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 13
LDI r2, 89
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
