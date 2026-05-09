; DESCRIPTION: Creates a orange rectangular region at (98, 43) spanning 13 by 80 pixels.
; PLAN: r0=98(x), r1=43(y), r2=13(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 43
LDI r2, 13
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
