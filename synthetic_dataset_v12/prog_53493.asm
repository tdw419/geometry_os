; DESCRIPTION: Creates a orange rectangular region at (427, 86) spanning 50 by 21 pixels.
; PLAN: r0=427(x), r1=86(y), r2=50(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 86
LDI r2, 50
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
