; DESCRIPTION: Creates a orange rectangular region at (0, 108) spanning 13 by 40 pixels.
; PLAN: r0=0(x), r1=108(y), r2=13(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 108
LDI r2, 13
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
