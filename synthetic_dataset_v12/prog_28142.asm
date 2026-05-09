; DESCRIPTION: Creates a orange rectangular region at (352, 148) spanning 105 by 91 pixels.
; PLAN: r0=352(x), r1=148(y), r2=105(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 148
LDI r2, 105
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
