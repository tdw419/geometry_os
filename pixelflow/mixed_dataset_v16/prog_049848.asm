; DESCRIPTION: Creates a blue rectangular region at (19, 52) spanning 95 by 96 pixels.
; PLAN: r0=19(x), r1=52(y), r2=95(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 52
LDI r2, 95
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
