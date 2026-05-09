; DESCRIPTION: Creates a blue rectangular region at (151, 135) spanning 74 by 24 pixels.
; PLAN: r0=151(x), r1=135(y), r2=74(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 135
LDI r2, 74
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
