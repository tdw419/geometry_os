; DESCRIPTION: Creates a blue rectangular region at (421, 196) spanning 19 by 12 pixels.
; PLAN: r0=421(x), r1=196(y), r2=19(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 196
LDI r2, 19
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
