; DESCRIPTION: Creates a green rectangular region at (363, 171) spanning 73 by 15 pixels.
; PLAN: r0=363(x), r1=171(y), r2=73(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 171
LDI r2, 73
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
