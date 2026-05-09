; DESCRIPTION: Creates a orange rectangular region at (98, 15) spanning 117 by 51 pixels.
; PLAN: r0=98(x), r1=15(y), r2=117(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 15
LDI r2, 117
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
