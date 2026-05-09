; DESCRIPTION: Creates a yellow rectangular region at (78, 148) spanning 12 by 65 pixels.
; PLAN: r0=78(x), r1=148(y), r2=12(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 148
LDI r2, 12
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
