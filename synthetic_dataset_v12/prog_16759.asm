; DESCRIPTION: Creates a blue rectangular region at (73, 95) spanning 33 by 56 pixels.
; PLAN: r0=73(x), r1=95(y), r2=33(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 95
LDI r2, 33
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
