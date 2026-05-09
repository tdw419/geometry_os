; DESCRIPTION: Creates a orange rectangular region at (33, 189) spanning 10 by 19 pixels.
; PLAN: r0=33(x), r1=189(y), r2=10(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 189
LDI r2, 10
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
