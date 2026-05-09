; DESCRIPTION: Creates a black rectangular region at (467, 77) spanning 28 by 51 pixels.
; PLAN: r0=467(x), r1=77(y), r2=28(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 77
LDI r2, 28
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
