; DESCRIPTION: Creates a orange rectangular region at (194, 188) spanning 51 by 38 pixels.
; PLAN: r0=194(x), r1=188(y), r2=51(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 188
LDI r2, 51
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
