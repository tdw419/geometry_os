; DESCRIPTION: Creates a orange rectangular region at (303, 233) spanning 105 by 13 pixels.
; PLAN: r0=303(x), r1=233(y), r2=105(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 233
LDI r2, 105
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
