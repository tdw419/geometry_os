; DESCRIPTION: Creates a orange rectangular region at (293, 113) spanning 68 by 100 pixels.
; PLAN: r0=293(x), r1=113(y), r2=68(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 113
LDI r2, 68
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
