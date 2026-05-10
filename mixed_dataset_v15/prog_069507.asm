; DESCRIPTION: Renders a orange rectangular region spanning 46 by 105 at (244, 5).
; PLAN: r0=244(x), r1=5(y), r2=46(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 5
LDI r2, 46
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
