; DESCRIPTION: Creates a orange rectangular region at (159, 148) spanning 40 by 27 pixels.
; PLAN: r0=159(x), r1=148(y), r2=40(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 148
LDI r2, 40
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
