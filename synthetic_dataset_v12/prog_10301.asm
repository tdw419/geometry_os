; DESCRIPTION: Creates a purple rectangular region at (247, 92) spanning 77 by 115 pixels.
; PLAN: r0=247(x), r1=92(y), r2=77(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 92
LDI r2, 77
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
