; DESCRIPTION: Draws a purple rectangle at (76, 152) with width 59 and height 23.
; PLAN: r0=76(x), r1=152(y), r2=59(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 152
LDI r2, 59
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
