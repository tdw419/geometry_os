; DESCRIPTION: Creates a blue rectangular region at (332, 111) spanning 115 by 64 pixels.
; PLAN: r0=332(x), r1=111(y), r2=115(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 111
LDI r2, 115
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
