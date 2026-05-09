; DESCRIPTION: Creates a orange rectangular region at (171, 131) spanning 51 by 76 pixels.
; PLAN: r0=171(x), r1=131(y), r2=51(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 131
LDI r2, 51
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
