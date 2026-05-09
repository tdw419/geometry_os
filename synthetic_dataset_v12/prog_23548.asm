; DESCRIPTION: Creates a orange rectangular region at (41, 136) spanning 51 by 111 pixels.
; PLAN: r0=41(x), r1=136(y), r2=51(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 136
LDI r2, 51
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
