; DESCRIPTION: Creates a orange rectangular region at (310, 176) spanning 37 by 74 pixels.
; PLAN: r0=310(x), r1=176(y), r2=37(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 176
LDI r2, 37
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
