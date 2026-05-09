; DESCRIPTION: Creates a blue rectangular region at (1, 15) spanning 32 by 74 pixels.
; PLAN: r0=1(x), r1=15(y), r2=32(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 15
LDI r2, 32
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
