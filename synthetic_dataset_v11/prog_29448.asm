; DESCRIPTION: Creates a orange rectangular region at (86, 130) spanning 85 by 118 pixels.
; PLAN: r0=86(x), r1=130(y), r2=85(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 130
LDI r2, 85
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
