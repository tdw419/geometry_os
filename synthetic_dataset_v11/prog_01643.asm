; DESCRIPTION: Creates a blue rectangular region at (111, 135) spanning 34 by 68 pixels.
; PLAN: r0=111(x), r1=135(y), r2=34(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 135
LDI r2, 34
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
