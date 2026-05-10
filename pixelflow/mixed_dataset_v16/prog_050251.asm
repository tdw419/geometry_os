; DESCRIPTION: Creates a orange rectangular region at (104, 63) spanning 105 by 28 pixels.
; PLAN: r0=104(x), r1=63(y), r2=105(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 63
LDI r2, 105
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
