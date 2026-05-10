; DESCRIPTION: Creates a black rectangular region at (279, 3) spanning 51 by 61 pixels.
; PLAN: r0=279(x), r1=3(y), r2=51(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 3
LDI r2, 51
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
