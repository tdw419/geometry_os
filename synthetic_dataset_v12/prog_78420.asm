; DESCRIPTION: Creates a blue rectangular region at (102, 183) spanning 112 by 61 pixels.
; PLAN: r0=102(x), r1=183(y), r2=112(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 183
LDI r2, 112
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
