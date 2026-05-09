; DESCRIPTION: Creates a orange rectangular region at (331, 135) spanning 105 by 112 pixels.
; PLAN: r0=331(x), r1=135(y), r2=105(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 135
LDI r2, 105
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
