; DESCRIPTION: Creates a blue rectangular region at (17, 103) spanning 96 by 63 pixels.
; PLAN: r0=17(x), r1=103(y), r2=96(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 103
LDI r2, 96
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
