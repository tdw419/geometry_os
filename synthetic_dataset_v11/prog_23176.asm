; DESCRIPTION: Creates a blue rectangular region at (101, 55) spanning 94 by 92 pixels.
; PLAN: r0=101(x), r1=55(y), r2=94(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 55
LDI r2, 94
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
