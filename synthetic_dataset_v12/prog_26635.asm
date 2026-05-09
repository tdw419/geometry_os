; DESCRIPTION: Creates a orange rectangular region at (237, 130) spanning 101 by 58 pixels.
; PLAN: r0=237(x), r1=130(y), r2=101(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 130
LDI r2, 101
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
