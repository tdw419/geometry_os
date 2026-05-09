; DESCRIPTION: Creates a blue rectangular region at (0, 54) spanning 101 by 95 pixels.
; PLAN: r0=0(x), r1=54(y), r2=101(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 54
LDI r2, 101
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
