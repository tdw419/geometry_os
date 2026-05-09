; DESCRIPTION: Creates a orange rectangular region at (203, 204) spanning 96 by 47 pixels.
; PLAN: r0=203(x), r1=204(y), r2=96(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 204
LDI r2, 96
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
