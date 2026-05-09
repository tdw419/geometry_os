; DESCRIPTION: Creates a blue rectangular region at (101, 77) spanning 12 by 64 pixels.
; PLAN: r0=101(x), r1=77(y), r2=12(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 77
LDI r2, 12
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
