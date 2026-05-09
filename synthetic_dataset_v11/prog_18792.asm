; DESCRIPTION: Creates a blue rectangular region at (51, 196) spanning 26 by 31 pixels.
; PLAN: r0=51(x), r1=196(y), r2=26(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 196
LDI r2, 26
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
