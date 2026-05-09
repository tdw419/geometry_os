; DESCRIPTION: Creates a green rectangular region at (463, 57) spanning 48 by 93 pixels.
; PLAN: r0=463(x), r1=57(y), r2=48(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 57
LDI r2, 48
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
