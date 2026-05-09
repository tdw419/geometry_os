; DESCRIPTION: Creates a blue rectangular region at (148, 124) spanning 55 by 18 pixels.
; PLAN: r0=148(x), r1=124(y), r2=55(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 124
LDI r2, 55
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
