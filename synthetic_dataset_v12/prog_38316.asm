; DESCRIPTION: Creates a orange rectangular region at (19, 48) spanning 43 by 10 pixels.
; PLAN: r0=19(x), r1=48(y), r2=43(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 48
LDI r2, 43
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
