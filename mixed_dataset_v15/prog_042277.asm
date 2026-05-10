; DESCRIPTION: Creates a green rectangular region at (365, 155) spanning 102 by 92 pixels.
; PLAN: r0=365(x), r1=155(y), r2=102(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 155
LDI r2, 102
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
