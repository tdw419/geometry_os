; DESCRIPTION: Creates a blue rectangular region at (365, 92) spanning 39 by 77 pixels.
; PLAN: r0=365(x), r1=92(y), r2=39(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 92
LDI r2, 39
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
