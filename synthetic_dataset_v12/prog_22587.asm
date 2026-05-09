; DESCRIPTION: Creates a white rectangular region at (109, 212) spanning 72 by 22 pixels.
; PLAN: r0=109(x), r1=212(y), r2=72(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 212
LDI r2, 72
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
