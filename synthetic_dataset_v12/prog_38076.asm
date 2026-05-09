; DESCRIPTION: Creates a green rectangular region at (178, 125) spanning 72 by 73 pixels.
; PLAN: r0=178(x), r1=125(y), r2=72(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 125
LDI r2, 72
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
