; DESCRIPTION: Creates a blue rectangular region at (120, 52) spanning 86 by 51 pixels.
; PLAN: r0=120(x), r1=52(y), r2=86(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 52
LDI r2, 86
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
