; DESCRIPTION: Creates a blue rectangular region at (423, 183) spanning 28 by 18 pixels.
; PLAN: r0=423(x), r1=183(y), r2=28(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 183
LDI r2, 28
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
