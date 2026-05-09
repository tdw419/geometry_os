; DESCRIPTION: Creates a blue rectangular region at (173, 34) spanning 72 by 72 pixels.
; PLAN: r0=173(x), r1=34(y), r2=72(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 34
LDI r2, 72
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
