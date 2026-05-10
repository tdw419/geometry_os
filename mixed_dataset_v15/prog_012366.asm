; DESCRIPTION: Creates a orange rectangular region at (63, 90) spanning 88 by 19 pixels.
; PLAN: r0=63(x), r1=90(y), r2=88(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 90
LDI r2, 88
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
