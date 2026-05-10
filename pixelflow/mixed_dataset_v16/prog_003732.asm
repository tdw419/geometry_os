; DESCRIPTION: Creates a purple rectangular region at (148, 233) spanning 111 by 22 pixels.
; PLAN: r0=148(x), r1=233(y), r2=111(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 233
LDI r2, 111
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
