; DESCRIPTION: Creates a orange rectangular region at (192, 130) spanning 57 by 107 pixels.
; PLAN: r0=192(x), r1=130(y), r2=57(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 130
LDI r2, 57
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
