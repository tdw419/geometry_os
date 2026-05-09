; DESCRIPTION: Creates a blue rectangular region at (112, 19) spanning 103 by 102 pixels.
; PLAN: r0=112(x), r1=19(y), r2=103(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 19
LDI r2, 103
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
