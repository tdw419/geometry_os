; DESCRIPTION: Creates a orange rectangular region at (0, 65) spanning 38 by 51 pixels.
; PLAN: r0=0(x), r1=65(y), r2=38(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 65
LDI r2, 38
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
