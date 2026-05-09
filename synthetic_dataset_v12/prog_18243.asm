; DESCRIPTION: Creates a orange rectangular region at (435, 88) spanning 68 by 108 pixels.
; PLAN: r0=435(x), r1=88(y), r2=68(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 88
LDI r2, 68
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
