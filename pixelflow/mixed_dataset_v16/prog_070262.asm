; DESCRIPTION: Creates a blue rectangular region at (228, 54) spanning 84 by 105 pixels.
; PLAN: r0=228(x), r1=54(y), r2=84(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 54
LDI r2, 84
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
