; DESCRIPTION: Creates a orange rectangular region at (108, 40) spanning 112 by 63 pixels.
; PLAN: r0=108(x), r1=40(y), r2=112(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 40
LDI r2, 112
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
