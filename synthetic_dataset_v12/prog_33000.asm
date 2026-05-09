; DESCRIPTION: Creates a green rectangular region at (352, 163) spanning 100 by 62 pixels.
; PLAN: r0=352(x), r1=163(y), r2=100(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 163
LDI r2, 100
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
