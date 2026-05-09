; DESCRIPTION: Creates a orange rectangular region at (369, 4) spanning 88 by 105 pixels.
; PLAN: r0=369(x), r1=4(y), r2=88(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 4
LDI r2, 88
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
