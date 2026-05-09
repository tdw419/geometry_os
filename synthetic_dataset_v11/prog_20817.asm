; DESCRIPTION: Creates a blue rectangular region at (111, 139) spanning 117 by 30 pixels.
; PLAN: r0=111(x), r1=139(y), r2=117(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 139
LDI r2, 117
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
