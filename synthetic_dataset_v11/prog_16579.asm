; DESCRIPTION: Creates a green rectangular region at (156, 161) spanning 78 by 90 pixels.
; PLAN: r0=156(x), r1=161(y), r2=78(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 161
LDI r2, 78
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
