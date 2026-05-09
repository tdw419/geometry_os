; DESCRIPTION: Creates a orange rectangular region at (106, 51) spanning 49 by 94 pixels.
; PLAN: r0=106(x), r1=51(y), r2=49(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 51
LDI r2, 49
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
