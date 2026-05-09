; DESCRIPTION: Creates a orange rectangular region at (370, 43) spanning 12 by 109 pixels.
; PLAN: r0=370(x), r1=43(y), r2=12(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 43
LDI r2, 12
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
