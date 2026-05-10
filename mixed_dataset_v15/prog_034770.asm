; DESCRIPTION: Creates a blue rectangular region at (426, 64) spanning 44 by 64 pixels.
; PLAN: r0=426(x), r1=64(y), r2=44(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 64
LDI r2, 44
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
