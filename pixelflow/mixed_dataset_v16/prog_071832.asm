; DESCRIPTION: Creates a green rectangular region at (98, 96) spanning 98 by 75 pixels.
; PLAN: r0=98(x), r1=96(y), r2=98(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 96
LDI r2, 98
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
