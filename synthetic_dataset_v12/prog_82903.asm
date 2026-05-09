; DESCRIPTION: Creates a orange rectangular region at (282, 132) spanning 30 by 108 pixels.
; PLAN: r0=282(x), r1=132(y), r2=30(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 132
LDI r2, 30
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
