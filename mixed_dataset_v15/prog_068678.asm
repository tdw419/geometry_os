; DESCRIPTION: Creates a yellow rectangular region at (365, 203) spanning 85 by 33 pixels.
; PLAN: r0=365(x), r1=203(y), r2=85(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 203
LDI r2, 85
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
