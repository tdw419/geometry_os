; DESCRIPTION: Creates a white rectangular region at (145, 92) spanning 51 by 98 pixels.
; PLAN: r0=145(x), r1=92(y), r2=51(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 92
LDI r2, 51
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
