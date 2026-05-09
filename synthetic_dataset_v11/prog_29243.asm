; DESCRIPTION: Creates a green rectangular region at (118, 92) spanning 25 by 77 pixels.
; PLAN: r0=118(x), r1=92(y), r2=25(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 92
LDI r2, 25
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
