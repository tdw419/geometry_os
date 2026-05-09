; DESCRIPTION: Creates a blue rectangular region at (173, 0) spanning 76 by 112 pixels.
; PLAN: r0=173(x), r1=0(y), r2=76(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 0
LDI r2, 76
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
