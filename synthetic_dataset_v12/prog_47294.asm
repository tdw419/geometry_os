; DESCRIPTION: Creates a blue rectangular region at (391, 49) spanning 24 by 64 pixels.
; PLAN: r0=391(x), r1=49(y), r2=24(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 49
LDI r2, 24
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
