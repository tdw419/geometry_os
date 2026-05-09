; DESCRIPTION: Creates a blue rectangular region at (92, 143) spanning 112 by 88 pixels.
; PLAN: r0=92(x), r1=143(y), r2=112(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 143
LDI r2, 112
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
