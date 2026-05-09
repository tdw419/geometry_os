; DESCRIPTION: Creates a purple rectangular region at (32, 136) spanning 54 by 95 pixels.
; PLAN: r0=32(x), r1=136(y), r2=54(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 136
LDI r2, 54
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
