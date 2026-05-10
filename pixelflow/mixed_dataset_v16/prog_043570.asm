; DESCRIPTION: Creates a blue rectangular region at (35, 52) spanning 26 by 120 pixels.
; PLAN: r0=35(x), r1=52(y), r2=26(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 52
LDI r2, 26
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
