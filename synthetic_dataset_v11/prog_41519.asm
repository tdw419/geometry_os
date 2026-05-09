; DESCRIPTION: Creates a green rectangular region at (126, 92) spanning 73 by 107 pixels.
; PLAN: r0=126(x), r1=92(y), r2=73(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 92
LDI r2, 73
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
