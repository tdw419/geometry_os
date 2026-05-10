; DESCRIPTION: Creates a orange rectangular region at (134, 130) spanning 107 by 69 pixels.
; PLAN: r0=134(x), r1=130(y), r2=107(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 130
LDI r2, 107
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
