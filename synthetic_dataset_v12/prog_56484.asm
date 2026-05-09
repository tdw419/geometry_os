; DESCRIPTION: Creates a orange rectangular region at (142, 19) spanning 105 by 51 pixels.
; PLAN: r0=142(x), r1=19(y), r2=105(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 19
LDI r2, 105
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
