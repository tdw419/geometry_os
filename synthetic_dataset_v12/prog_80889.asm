; DESCRIPTION: Creates a green rectangular region at (236, 125) spanning 53 by 56 pixels.
; PLAN: r0=236(x), r1=125(y), r2=53(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 125
LDI r2, 53
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
