; DESCRIPTION: Creates a orange rectangular region at (213, 56) spanning 68 by 23 pixels.
; PLAN: r0=213(x), r1=56(y), r2=68(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 56
LDI r2, 68
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
