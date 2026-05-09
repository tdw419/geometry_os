; DESCRIPTION: Creates a blue rectangular region at (142, 162) spanning 32 by 86 pixels.
; PLAN: r0=142(x), r1=162(y), r2=32(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 162
LDI r2, 32
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
