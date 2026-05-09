; DESCRIPTION: Creates a blue rectangular region at (72, 0) spanning 63 by 36 pixels.
; PLAN: r0=72(x), r1=0(y), r2=63(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 0
LDI r2, 63
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
