; DESCRIPTION: Creates a blue rectangular region at (3, 112) spanning 65 by 92 pixels.
; PLAN: r0=3(x), r1=112(y), r2=65(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 112
LDI r2, 65
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
