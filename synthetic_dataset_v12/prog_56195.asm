; DESCRIPTION: Creates a orange rectangular region at (191, 130) spanning 100 by 56 pixels.
; PLAN: r0=191(x), r1=130(y), r2=100(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 130
LDI r2, 100
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
