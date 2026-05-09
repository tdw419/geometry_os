; DESCRIPTION: Creates a blue rectangular region at (18, 142) spanning 64 by 21 pixels.
; PLAN: r0=18(x), r1=142(y), r2=64(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 142
LDI r2, 64
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
