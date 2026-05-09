; DESCRIPTION: Creates a blue rectangular region at (173, 199) spanning 66 by 38 pixels.
; PLAN: r0=173(x), r1=199(y), r2=66(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 199
LDI r2, 66
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
