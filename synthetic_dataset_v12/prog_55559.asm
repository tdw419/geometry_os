; DESCRIPTION: Creates a green rectangular region at (244, 74) spanning 27 by 35 pixels.
; PLAN: r0=244(x), r1=74(y), r2=27(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 74
LDI r2, 27
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
