; DESCRIPTION: Creates a blue rectangular region at (209, 81) spanning 50 by 106 pixels.
; PLAN: r0=209(x), r1=81(y), r2=50(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 81
LDI r2, 50
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
