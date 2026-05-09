; DESCRIPTION: Creates a orange rectangular region at (297, 130) spanning 57 by 82 pixels.
; PLAN: r0=297(x), r1=130(y), r2=57(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 130
LDI r2, 57
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
