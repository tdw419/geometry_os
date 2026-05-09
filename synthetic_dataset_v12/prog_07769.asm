; DESCRIPTION: Creates a blue rectangular region at (262, 139) spanning 105 by 33 pixels.
; PLAN: r0=262(x), r1=139(y), r2=105(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 139
LDI r2, 105
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
