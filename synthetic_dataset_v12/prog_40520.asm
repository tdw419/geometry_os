; DESCRIPTION: Creates a blue rectangular region at (421, 114) spanning 84 by 27 pixels.
; PLAN: r0=421(x), r1=114(y), r2=84(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 114
LDI r2, 84
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
