; DESCRIPTION: Creates a blue rectangular region at (25, 153) spanning 92 by 35 pixels.
; PLAN: r0=25(x), r1=153(y), r2=92(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 153
LDI r2, 92
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
