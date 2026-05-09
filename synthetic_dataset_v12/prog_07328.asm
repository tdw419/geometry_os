; DESCRIPTION: Creates a orange rectangular region at (199, 105) spanning 39 by 12 pixels.
; PLAN: r0=199(x), r1=105(y), r2=39(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 105
LDI r2, 39
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
