; DESCRIPTION: Renders a orange rectangular region spanning 51 by 57 at (383, 189).
; PLAN: r0=383(x), r1=189(y), r2=51(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 189
LDI r2, 51
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
