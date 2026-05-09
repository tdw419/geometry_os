; DESCRIPTION: Creates a green rectangular region at (71, 102) spanning 28 by 79 pixels.
; PLAN: r0=71(x), r1=102(y), r2=28(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 102
LDI r2, 28
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
