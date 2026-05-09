; DESCRIPTION: Creates a blue rectangular region at (283, 51) spanning 50 by 35 pixels.
; PLAN: r0=283(x), r1=51(y), r2=50(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 51
LDI r2, 50
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
