; DESCRIPTION: Creates a orange rectangular region at (358, 41) spanning 51 by 27 pixels.
; PLAN: r0=358(x), r1=41(y), r2=51(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 41
LDI r2, 51
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
