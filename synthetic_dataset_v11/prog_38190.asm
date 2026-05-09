; DESCRIPTION: Creates a blue rectangular region at (10, 74) spanning 111 by 38 pixels.
; PLAN: r0=10(x), r1=74(y), r2=111(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 74
LDI r2, 111
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
