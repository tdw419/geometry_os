; DESCRIPTION: Creates a blue rectangular region at (310, 106) spanning 113 by 100 pixels.
; PLAN: r0=310(x), r1=106(y), r2=113(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 106
LDI r2, 113
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
