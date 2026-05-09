; DESCRIPTION: Creates a green rectangular region at (410, 144) spanning 24 by 78 pixels.
; PLAN: r0=410(x), r1=144(y), r2=24(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 144
LDI r2, 24
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
