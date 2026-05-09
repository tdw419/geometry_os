; DESCRIPTION: Creates a blue rectangular region at (96, 16) spanning 117 by 43 pixels.
; PLAN: r0=96(x), r1=16(y), r2=117(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 16
LDI r2, 117
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
