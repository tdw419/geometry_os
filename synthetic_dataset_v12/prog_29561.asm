; DESCRIPTION: Creates a orange rectangular region at (148, 3) spanning 63 by 30 pixels.
; PLAN: r0=148(x), r1=3(y), r2=63(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 3
LDI r2, 63
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
