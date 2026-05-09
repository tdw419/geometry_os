; DESCRIPTION: Creates a orange rectangular region at (222, 130) spanning 106 by 38 pixels.
; PLAN: r0=222(x), r1=130(y), r2=106(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 130
LDI r2, 106
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
