; DESCRIPTION: Creates a yellow rectangular region at (365, 92) spanning 119 by 92 pixels.
; PLAN: r0=365(x), r1=92(y), r2=119(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 92
LDI r2, 119
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
