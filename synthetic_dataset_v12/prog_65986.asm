; DESCRIPTION: Creates a orange rectangular region at (121, 43) spanning 51 by 99 pixels.
; PLAN: r0=121(x), r1=43(y), r2=51(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 43
LDI r2, 51
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
