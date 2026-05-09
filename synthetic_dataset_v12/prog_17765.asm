; DESCRIPTION: Creates a orange rectangular region at (51, 145) spanning 49 by 51 pixels.
; PLAN: r0=51(x), r1=145(y), r2=49(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 145
LDI r2, 49
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
