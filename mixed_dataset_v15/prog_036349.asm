; DESCRIPTION: Creates a orange rectangular region at (442, 130) spanning 64 by 102 pixels.
; PLAN: r0=442(x), r1=130(y), r2=64(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 130
LDI r2, 64
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
