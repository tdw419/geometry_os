; DESCRIPTION: Creates a blue rectangular region at (345, 130) spanning 38 by 30 pixels.
; PLAN: r0=345(x), r1=130(y), r2=38(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 130
LDI r2, 38
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
