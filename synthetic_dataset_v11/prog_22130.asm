; DESCRIPTION: Creates a blue rectangular region at (125, 99) spanning 113 by 29 pixels.
; PLAN: r0=125(x), r1=99(y), r2=113(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 99
LDI r2, 113
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
