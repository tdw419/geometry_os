; DESCRIPTION: Creates a green rectangular region at (372, 153) spanning 72 by 51 pixels.
; PLAN: r0=372(x), r1=153(y), r2=72(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 153
LDI r2, 72
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
