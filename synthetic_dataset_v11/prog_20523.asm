; DESCRIPTION: Creates a green rectangular region at (24, 9) spanning 75 by 93 pixels.
; PLAN: r0=24(x), r1=9(y), r2=75(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 9
LDI r2, 75
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
