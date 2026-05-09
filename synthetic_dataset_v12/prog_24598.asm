; DESCRIPTION: Creates a blue rectangular region at (228, 140) spanning 105 by 81 pixels.
; PLAN: r0=228(x), r1=140(y), r2=105(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 140
LDI r2, 105
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
