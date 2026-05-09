; DESCRIPTION: Creates a orange rectangular region at (407, 113) spanning 23 by 109 pixels.
; PLAN: r0=407(x), r1=113(y), r2=23(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 113
LDI r2, 23
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
