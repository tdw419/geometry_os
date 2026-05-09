; DESCRIPTION: Creates a orange rectangular region at (245, 63) spanning 35 by 112 pixels.
; PLAN: r0=245(x), r1=63(y), r2=35(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 63
LDI r2, 35
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
