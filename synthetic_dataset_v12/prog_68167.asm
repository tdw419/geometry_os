; DESCRIPTION: Creates a blue rectangular region at (196, 111) spanning 78 by 16 pixels.
; PLAN: r0=196(x), r1=111(y), r2=78(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 111
LDI r2, 78
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
