; DESCRIPTION: Creates a blue rectangular region at (166, 100) spanning 26 by 112 pixels.
; PLAN: r0=166(x), r1=100(y), r2=26(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 100
LDI r2, 26
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
