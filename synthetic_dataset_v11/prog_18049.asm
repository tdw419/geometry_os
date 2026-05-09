; DESCRIPTION: Creates a blue rectangular region at (0, 171) spanning 110 by 32 pixels.
; PLAN: r0=0(x), r1=171(y), r2=110(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 171
LDI r2, 110
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
