; DESCRIPTION: Creates a blue rectangular region at (22, 48) spanning 18 by 39 pixels.
; PLAN: r0=22(x), r1=48(y), r2=18(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 48
LDI r2, 18
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
