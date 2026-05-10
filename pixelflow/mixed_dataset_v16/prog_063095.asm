; DESCRIPTION: Creates a orange rectangular region at (15, 130) spanning 75 by 21 pixels.
; PLAN: r0=15(x), r1=130(y), r2=75(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 130
LDI r2, 75
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
