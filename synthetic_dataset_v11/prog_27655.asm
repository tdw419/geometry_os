; DESCRIPTION: Creates a blue rectangular region at (167, 188) spanning 51 by 65 pixels.
; PLAN: r0=167(x), r1=188(y), r2=51(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 188
LDI r2, 51
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
