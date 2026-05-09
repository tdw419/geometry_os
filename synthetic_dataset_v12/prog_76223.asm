; DESCRIPTION: Creates a black rectangular region at (85, 172) spanning 40 by 68 pixels.
; PLAN: r0=85(x), r1=172(y), r2=40(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 172
LDI r2, 40
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
