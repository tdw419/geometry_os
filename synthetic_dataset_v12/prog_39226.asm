; DESCRIPTION: Creates a black rectangular region at (51, 202) spanning 82 by 39 pixels.
; PLAN: r0=51(x), r1=202(y), r2=82(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 202
LDI r2, 82
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
