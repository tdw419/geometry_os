; DESCRIPTION: Creates a blue rectangular region at (69, 52) spanning 48 by 101 pixels.
; PLAN: r0=69(x), r1=52(y), r2=48(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 52
LDI r2, 48
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
