; DESCRIPTION: Creates a orange rectangular region at (254, 178) spanning 31 by 25 pixels.
; PLAN: r0=254(x), r1=178(y), r2=31(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 178
LDI r2, 31
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
