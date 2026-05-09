; DESCRIPTION: Creates a orange rectangular region at (216, 43) spanning 27 by 13 pixels.
; PLAN: r0=216(x), r1=43(y), r2=27(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 43
LDI r2, 27
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
