; DESCRIPTION: Creates a blue rectangular region at (100, 18) spanning 59 by 59 pixels.
; PLAN: r0=100(x), r1=18(y), r2=59(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 18
LDI r2, 59
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
