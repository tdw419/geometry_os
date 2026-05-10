; DESCRIPTION: Creates a orange rectangular region at (122, 152) spanning 24 by 102 pixels.
; PLAN: r0=122(x), r1=152(y), r2=24(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 152
LDI r2, 24
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
