; DESCRIPTION: Creates a orange rectangular region at (275, 178) spanning 105 by 26 pixels.
; PLAN: r0=275(x), r1=178(y), r2=105(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 178
LDI r2, 105
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
