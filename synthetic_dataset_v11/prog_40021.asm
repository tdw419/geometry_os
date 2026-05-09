; DESCRIPTION: Creates a green rectangular region at (121, 38) spanning 28 by 51 pixels.
; PLAN: r0=121(x), r1=38(y), r2=28(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 38
LDI r2, 28
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
