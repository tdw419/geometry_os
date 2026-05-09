; DESCRIPTION: Creates a green rectangular region at (29, 166) spanning 113 by 35 pixels.
; PLAN: r0=29(x), r1=166(y), r2=113(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 166
LDI r2, 113
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
