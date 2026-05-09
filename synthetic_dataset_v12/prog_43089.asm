; DESCRIPTION: Creates a blue rectangular region at (181, 131) spanning 25 by 24 pixels.
; PLAN: r0=181(x), r1=131(y), r2=25(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 131
LDI r2, 25
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
