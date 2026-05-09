; DESCRIPTION: Creates a green rectangular region at (113, 142) spanning 110 by 105 pixels.
; PLAN: r0=113(x), r1=142(y), r2=110(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 142
LDI r2, 110
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
