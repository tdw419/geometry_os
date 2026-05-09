; DESCRIPTION: Creates a green rectangular region at (28, 76) spanning 95 by 75 pixels.
; PLAN: r0=28(x), r1=76(y), r2=95(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 76
LDI r2, 95
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
