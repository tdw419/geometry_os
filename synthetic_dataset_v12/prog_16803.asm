; DESCRIPTION: Creates a purple rectangular region at (377, 20) spanning 66 by 111 pixels.
; PLAN: r0=377(x), r1=20(y), r2=66(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 20
LDI r2, 66
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
