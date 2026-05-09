; DESCRIPTION: Creates a green rectangular region at (113, 53) spanning 51 by 35 pixels.
; PLAN: r0=113(x), r1=53(y), r2=51(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 53
LDI r2, 51
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
