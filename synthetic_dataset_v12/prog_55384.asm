; DESCRIPTION: Creates a blue rectangular region at (199, 43) spanning 47 by 92 pixels.
; PLAN: r0=199(x), r1=43(y), r2=47(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 43
LDI r2, 47
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
