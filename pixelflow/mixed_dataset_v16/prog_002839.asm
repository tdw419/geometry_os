; DESCRIPTION: Creates a blue rectangular region at (135, 96) spanning 64 by 46 pixels.
; PLAN: r0=135(x), r1=96(y), r2=64(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 96
LDI r2, 64
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
