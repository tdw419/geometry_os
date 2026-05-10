; DESCRIPTION: Creates a black rectangular region at (178, 51) spanning 111 by 24 pixels.
; PLAN: r0=178(x), r1=51(y), r2=111(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 51
LDI r2, 111
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
