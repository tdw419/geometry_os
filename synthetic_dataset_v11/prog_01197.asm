; DESCRIPTION: Creates a green rectangular region at (125, 101) spanning 113 by 22 pixels.
; PLAN: r0=125(x), r1=101(y), r2=113(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 101
LDI r2, 113
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
