; DESCRIPTION: Creates a orange rectangular region at (215, 51) spanning 60 by 114 pixels.
; PLAN: r0=215(x), r1=51(y), r2=60(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 51
LDI r2, 60
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
