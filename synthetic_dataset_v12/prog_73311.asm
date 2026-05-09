; DESCRIPTION: Creates a blue rectangular region at (450, 76) spanning 55 by 81 pixels.
; PLAN: r0=450(x), r1=76(y), r2=55(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 76
LDI r2, 55
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
