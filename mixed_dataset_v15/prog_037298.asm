; DESCRIPTION: Creates a green rectangular region at (168, 35) spanning 84 by 93 pixels.
; PLAN: r0=168(x), r1=35(y), r2=84(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 35
LDI r2, 84
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
