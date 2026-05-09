; DESCRIPTION: Creates a orange rectangular region at (163, 130) spanning 62 by 45 pixels.
; PLAN: r0=163(x), r1=130(y), r2=62(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 130
LDI r2, 62
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
