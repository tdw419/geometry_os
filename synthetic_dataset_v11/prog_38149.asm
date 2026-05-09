; DESCRIPTION: Creates a blue rectangular region at (72, 63) spanning 33 by 74 pixels.
; PLAN: r0=72(x), r1=63(y), r2=33(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 63
LDI r2, 33
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
