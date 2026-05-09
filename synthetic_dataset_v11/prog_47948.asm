; DESCRIPTION: Creates a blue rectangular region at (34, 36) spanning 92 by 112 pixels.
; PLAN: r0=34(x), r1=36(y), r2=92(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 36
LDI r2, 92
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
