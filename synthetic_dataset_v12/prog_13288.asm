; DESCRIPTION: Creates a blue rectangular region at (59, 177) spanning 100 by 56 pixels.
; PLAN: r0=59(x), r1=177(y), r2=100(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 177
LDI r2, 100
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
