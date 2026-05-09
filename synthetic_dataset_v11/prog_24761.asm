; DESCRIPTION: Creates a blue rectangular region at (172, 113) spanning 32 by 93 pixels.
; PLAN: r0=172(x), r1=113(y), r2=32(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 113
LDI r2, 32
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
