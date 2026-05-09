; DESCRIPTION: Creates a blue rectangular region at (325, 59) spanning 76 by 74 pixels.
; PLAN: r0=325(x), r1=59(y), r2=76(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 59
LDI r2, 76
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
