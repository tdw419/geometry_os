; DESCRIPTION: Creates a green rectangular region at (125, 46) spanning 20 by 72 pixels.
; PLAN: r0=125(x), r1=46(y), r2=20(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 46
LDI r2, 20
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
