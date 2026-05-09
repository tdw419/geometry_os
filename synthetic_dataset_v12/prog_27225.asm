; DESCRIPTION: Creates a blue rectangular region at (183, 86) spanning 96 by 111 pixels.
; PLAN: r0=183(x), r1=86(y), r2=96(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 86
LDI r2, 96
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
