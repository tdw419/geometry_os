; DESCRIPTION: Creates a orange rectangular region at (224, 148) spanning 19 by 29 pixels.
; PLAN: r0=224(x), r1=148(y), r2=19(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 148
LDI r2, 19
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
