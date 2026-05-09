; DESCRIPTION: Creates a green rectangular region at (184, 170) spanning 36 by 47 pixels.
; PLAN: r0=184(x), r1=170(y), r2=36(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 170
LDI r2, 36
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
