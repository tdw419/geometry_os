; DESCRIPTION: Renders a orange rectangular region spanning 30 by 78 at (172, 104).
; PLAN: r0=172(x), r1=104(y), r2=30(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 104
LDI r2, 30
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
