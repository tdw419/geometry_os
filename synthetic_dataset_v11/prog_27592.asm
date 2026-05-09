; DESCRIPTION: Creates a blue rectangular region at (81, 92) spanning 100 by 120 pixels.
; PLAN: r0=81(x), r1=92(y), r2=100(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 92
LDI r2, 100
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
