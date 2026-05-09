; DESCRIPTION: Creates a orange rectangular region at (172, 21) spanning 51 by 78 pixels.
; PLAN: r0=172(x), r1=21(y), r2=51(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 21
LDI r2, 51
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
