; DESCRIPTION: Creates a orange rectangular region at (52, 76) spanning 103 by 51 pixels.
; PLAN: r0=52(x), r1=76(y), r2=103(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 76
LDI r2, 103
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
